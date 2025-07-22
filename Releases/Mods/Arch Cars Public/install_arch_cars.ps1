Clear-Host
Write-Host ""

# these paths need to be updated if Girellu directory structure changes
$script:archCarsRoot = ".\ARCH_CARS"
$script:donorCars = Get-Content -Path ".\donor_cars.txt"

if (-not($donorCars)) {
    Write-Host "Failed to get cars to install from donor_cars.txt, cannot proceed" -BackgroundColor Red
    Read-Host "Press Enter to close this window"
    Exit
}

# finding AC install directory
$script:acRoot = ""

function Find-Ac {
    $steamInstallLocation = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 244210" -Name InstallLocation).InstallLocation
    if (Test-Path -Path $steamInstallLocation) {
        $answer = Read-Host -prompt "Found Assetto Corsa in $steamInstallLocation, is this correct? (y/n)"
        if ($answer -eq "y") {
            $script:acRoot = $steamInstallLocation
        }
    }
    if (-not($acRoot)) {
        Write-Host "Where is your Assetto Corsa root folder?"
        Add-Type -AssemblyName "System.Windows.Forms"
        $browser = New-Object "System.Windows.Forms.FolderBrowserDialog" -Property @{ Description = "Select your Assetto Corsa root folder (usually it's C:\Program Files\Steam\steamapps\common\assettocorsa)" }
        [void]$browser.ShowDialog()
        $script:acRoot = $browser.SelectedPath
    }
}

Find-Ac

# installing cars
$script:successfullInstalls = 0
$script:failedInstalls = 0

function Install-Car {
    param ([string]$archCar, [string]$donorCar)

    Write-Host ""
    Write-Host "Installing $archCar, donor car is $donorCar..."

    $archCarSourcePath = "$script:archCarsRoot\content\cars\$archCar"
    $donorCarPath = "$script:acRoot\content\cars\$donorCar"
    $archCarDestinationPath = "$script:acRoot\content\cars\$archCar"

    if (-not(Test-Path -Path "$donorCarPath\driver_base_pos.knh" -PathType Leaf)) {
        Write-Host "Could not find the donor car $donorCar in your game files, skipping." -BackgroundColor Red
        $script:failedInstalls++
        Return
    }

    # prepare destination car directory
    if (Test-Path -Path $archCarDestinationPath) {
        # destination car already exists - either installed previously, or destination = donor; anyway, no need to copy anything
        Write-Host "Updating existing car..." -NoNewline
    } else {
        Write-Host "Creating new car $archCar..." -NoNewline

        # create the destination directory and copy everything from donor
        [void](New-Item -ItemType "directory" -Path $archCarDestinationPath -Force)
        Copy-Item "$donorCarPath\*" -Destination $archCarDestinationPath -Recurse -Force

        # sort out sfx
        Rename-Item "$archCarDestinationPath\sfx\$donorCar.bank" "$archCar.bank"
        if (-not(Test-Path -Path "$donorCarPath\sfx\GUIDS.txt" -PathType Leaf)) {
            (Get-Content "$acRoot\content\sfx\GUIDS.txt") -Replace $donorCar, $archCar | Set-Content "$archCarDestinationPath\sfx\GUIDS.txt"
            Set-Content -Path "$archCarDestinationPath\sfx\GUIDS.txt" -Value (Get-Content -Path "$archCarDestinationPath\sfx\GUIDS.txt" | Select-String -Pattern "$archCar/|grp_|common|bus:")
        } else {
            Write-Host " Detected sound mod, adjusting existing guids..." -NoNewline
            (Get-Content "$archCarDestinationPath\sfx\GUIDS.txt") -Replace $donorCar, $archCar | Set-Content "$archCarDestinationPath\sfx\GUIDS.txt"
        }

        # install VAO patch if present
        if (Test-Path -Path "$archCarDestinationPath\extension\vao-patches-cars") {
            Write-Host " Found vaopatch, installing..." -NoNewline
            Copy-Item "$archCarDestinationPath\extension\vao-patches-cars\*" -Destination "$script:acRoot\extension\vao-patches-cars\" -Recurse -Force
        }
    }

    # delete any and all physics in the destination directory, to ensure clean install
    if (Test-Path -Path "$archCarDestinationPath\data.acd") {
        Remove-Item "$archCarDestinationPath\data.acd" -Force
    }
    if (Test-Path -Path "$archCarDestinationPath\data") {
        Remove-Item "$archCarDestinationPath\data" -Recurse -Force
    }

    # copy stuff from Girellu
    Copy-Item "$archCarSourcePath\*" -Destination $archCarDestinationPath -Recurse -Force

    Write-Host " Done."
    $script:successfullInstalls++
}

Write-Host ""
Write-Host "There are $($donorCars.Count) cars to install."
Write-Host "Installation of some cars may fail if you are missing the corresponding `"donor car`" (= car to use visuals from)." -Foregroundcolor Gray
Write-Host "That is fine, it won't prevent other cars from being installed correctly." -Foregroundcolor Gray
Write-Host "Any existing physics data (packed or unpacked) in the destination folders will be deleted!"
Read-Host "Press Enter to begin"

foreach ($line in $donorCars) {
    $archCar = ($line -split ",")[0]
    $donorCar = ($line -split ",")[1]
    Install-Car $archCar $donorCar
}

Write-Host ""
Write-Host "All done! $script:successfullInstalls cars installed successfully, $script:failedInstalls cars not installed."
Read-Host "Press Enter to close this window"
