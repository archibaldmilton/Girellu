$script:commit = "master" # the commit, or branch to download, master is fine.
$script:girellu = $pwd
Clear-Host

if (Test-Path -Path "ARCH_CARS_UPDATE_LOG.txt"  -PathType Leaf) {
    Write-Host 'We are working from the mod folder, proceeding to install.'
    $script:girellu = Split-Path -Resolve "$script:girellu\..\.."
} else {
    Write-Host 'Downloading Arch''s physics from github.com/archibaldmilton/Girellu...'

    $webclient = New-Object System.Net.WebClient
    $url = "https://github.com/archibaldmilton/Girellu/archive/$script:commit.zip"
    $zip = "$pwd\girellu.zip"
    $webclient.DownloadFile($url, $zip)

    $script:girellu = "$pwd\Girellu-$script:commit"
    if (Test-Path -Path $script:girellu) {
        Remove-Item $script:girellu -Recurse -Force
    }

    Write-Host 'Unzipping...'

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zip, $pwd)
}


$script:ac_root = 0

function Find-Ac {
    $steam_install_location = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 244210" -Name InstallLocation).InstallLocation

    if (Test-Path -Path $steam_install_location) {
        Write-Host ''
        $answer = read-host -prompt "Found Assetto Corsa in $steam_install_location, is this correct? (y/n)"
        if ($answer -eq "y") {
            $script:ac_root = $steam_install_location
        }
    }
    if (-not($ac_root)) {
        Write-Host 'Where is your Assetto Corsa root folder?'
        Add-Type -AssemblyName System.Windows.Forms
        $browser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{ Description = 'Select your Assetto Corsa root folder (usually it''s C:\Program Files\Steam\steamapps\common\assettocorsa)' }
        [void] $browser.ShowDialog()
        $script:ac_root = $browser.SelectedPath
    }
    
}
Find-Ac


function Install-Car {
    param(
         [Parameter()]
         [string]$arch_folder,

         [Parameter()]
         [string]$arch_car,

         [Parameter()]
         [string]$kunos_car,

         [Parameter()]
         [string]$ac_root
    )
    $arch_physics = "$arch_folder\content\cars\$arch_car"

    if (-not(Test-Path -Path "$ac_root\content\cars\$kunos_car\data.acd" -PathType Leaf)) {
        Write-Host "ERROR: Can't find donor car to use visuals from (was looking for $kunos_car)"
        Write-Host 'ERROR: Either the path to Assetto Corsa root folder is wrong, or the donor car is missing (probably DLC?)'
        $answer = read-host -prompt "Do you want to define a custom one? (y/n)"
        if ($answer -eq "y") {
            $kunos_car = read-host -prompt "Please enter the donor car's name now."
            if (-not(Test-Path -Path "$ac_root\content\cars\$kunos_car\data.acd" -PathType Leaf)) {
                Write-Host 'ERROR: Could not find the specified car, exiting.'
                Exit
            }
        } else {
            return
        }
    }


    Write-Host ''
    Write-Host "Creating $arch_car, using visuals from $kunos_car"

    if (-not($script:deleteArchCars -eq "a")) {
        if (Test-Path -Path "$ac_root\content\cars\$arch_car") {
            $script:deleteArchCars = read-host -prompt "$arch_car is already installed, clean install to ensure latest version? (y/n/a)"
        }
    }

    if ($script:deleteArchCars -eq "a" -or $script:deleteArchCars -eq "y") {
        Remove-Item "$ac_root\content\cars\$arch_car" -Recurse -Force
        if ($script:deleteArchCars -eq "y") {
            $script:deleteArchCars = 0 # clean up after ourselves
        }
    }

    New-Item -ItemType "directory" -Path "$ac_root\content\cars\$arch_car" -Force
    Get-ChildItem "$ac_root\content\cars\$kunos_car" | Copy-Item -Destination "$ac_root\content\cars\$arch_car" -Recurse -Force
    Get-ChildItem "$arch_physics" -Recurse | Copy-Item -Destination "$ac_root\content\cars\$arch_car" -Recurse -Force
    if (-not(Test-Path -Path "$ac_root\content\cars\$kunos_car\sfx\GUIDS.txt"  -PathType Leaf)) {
        (Get-Content "$ac_root\content\sfx\GUIDS.txt") -Replace $kunos_car, $arch_car | Set-Content "$ac_root\content\cars\$arch_car\sfx\GUIDS.txt"
        Rename-Item "$ac_root\content\cars\$arch_car\sfx\$kunos_car.bank" "$arch_car.bank"
        Set-Content -Path "$ac_root\content\cars\$arch_car\sfx\GUIDS.txt" -Value (get-content -Path "$ac_root\content\cars\$arch_car\sfx\GUIDS.txt" | Select-String -Pattern "$arch_car/|grp_|common|bus:")
    } else {
        Write-Host "detected sound mod, adjusting existing guids.."
        (Get-Content "$ac_root\content\cars\$arch_car\sfx\GUIDS.txt") -Replace $kunos_car, $arch_car | Set-Content "$ac_root\content\cars\$arch_car\sfx\GUIDS.txt"
        Rename-Item "$ac_root\content\cars\$arch_car\sfx\$kunos_car.bank" "$arch_car.bank"
    }

    if (Test-Path "$arch_folder\extension\vao-patches-cars") {
        Write-Host "found vaopatch, installing..."
        Get-ChildItem "$arch_folder\extension\vao-patches-cars\" -Recurse | Copy-Item -Destination "$ac_root\extension\vao-patches-cars\" -Recurse
    }
}

# get all folders inside "$script:girellu\Releases\Mods\Arch Cars Public\"
$dirs = Get-ChildItem -Path "$script:girellu\Releases\Mods\Arch Cars Public\"

foreach ($dir in $dirs) {
    $absolutePath = "$script:girellu\Releases\Mods\Arch Cars Public\$dir"
    if (Test-Path -Path "$absolutePath\content\cars\") {
        $arch_cars = $()
        # get all folders inside "$dir\content\cars\" and add them to $arch_cars array
        $arch_cars = Get-ChildItem -Path "$absolutePath\content\cars\"
        $arch_cars = $arch_cars | Select-Object -Unique

        foreach ($arch_car in $arch_cars) {
            if ($arch_car -match "_") {
                if ($arch_car -inotmatch " ") {
                    $kunos_car = ""


                    if (Test-Path -Path "$script:girellu\Releases\Mods\Arch Cars Public\donor_cars.txt" -PathType Leaf) {
                        $donor_cars = Get-Content -Path "$script:girellu\Releases\Mods\Arch Cars Public\donor_cars.txt"
                        foreach ($donor_car in $donor_cars) {
                            # seperate $donor_car by comma into array
                            $donor_car = $donor_car -split ","
                            # if $arch_car matches first entry, set $kunos_car to second entry
                            if ($arch_car -match $donor_car[0]) {
                                $kunos_car = $donor_car[1]
                            }
                        }
                    } else {
                        Write-Host "ERROR: Could not find donor_cars.txt, using fallback method" -ForegroundColor Red
                    }
                    
                    if ($kunos_car -eq "") { # this should only get triggered if new cars werent added to donor_cars.txt
                        $ext_config = Get-Content -Path "$absolutePath\content\cars\$arch_car\extension\ext_config.ini"
                        $ext_config | Where-Object { $_ -match "cars/kunos/" } | Select-String -Pattern "cars/kunos/(.*).ini" | ForEach-Object { $kunos_car = @($_.Matches.Value) }
                        
                        # strip .ini and "cars/kunos/" from $kunos_car
                        $kunos_car = $kunos_car.Replace(".ini", "").Replace("cars/kunos/", "")
                    }
                    if ($kunos_car -eq "") { # ideally, this should never get triggered, because it's horrible code that will likely fail
                        # read "!README AND INSTRUCTIONS.txt" in $dir
                        $readme = Get-Content -Path "$absolutePath\!README AND INSTRUCTIONS.txt"
                        $kunos_candidates = $()
                        # find every occurance of line with "copy from folder" or "Repeat process from folder" inside $readme and insert them into kunos_candidates array
                        $kunos_candidates = $readme | Where-Object {  $_ -match "copy from folder" -or $_ -match "Repeat process from folder" } 

                        foreach ($car in $kunos_candidates) {
                            # strip "copy from folder " from $car
                            $car = $car.Replace("copy from folder ", "").Replace('"', '').Replace('Repeat process from folder ', '').Replace(' for:', '')

                            # check if we can find arch car name nearby (-3 lines and +5 lines)
                            $a = Select-String $readme -pattern "$car" -Context 3,5
                            if ($a -match $arch_car) {
                                $kunos_car = $car
                            }
                        }
                    }

                    if ($kunos_car -eq "") {
                        Write-Host "Could not find kunos car for $arch_car, this is bad." -BackgroundColor Red
                        Start-Sleep -s 3
                    } else {
                        if (Test-Path -Path "$ac_root\content\cars\$kunos_car\data.acd" -PathType Leaf) {
                            Install-Car $absolutePath $arch_car $kunos_car $ac_root
                        } else {
                            Write-Host "Could not find $kunos_car in your game files, you may be missing DLC, this car will be skipped." -BackgroundColor Red
                            Start-Sleep -s 5
                        }
                    }
                }
            }
        }
    }
}

Write-Host 'Success!'
Write-Host 'If your sounds are broken on certain cars you may need to replace them in CM:'
Write-Host 'Open Content Manager, go to Content -> Cars, and search for "arch"'
Write-Host 'You will find the created cars. For the broken cars, you have to:'
Write-Host '1. Click Replace sound'
Write-Host '2. Select car to use sounds from'
Write-Host '3. Click OK'
Write-Host ''

Write-Host 'You can now close this window.'
