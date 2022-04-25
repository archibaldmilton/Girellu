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


$common_ac_paths = @(
    "${Env:ProgramFiles(x86)}\Steam\steamapps\common\assettocorsa",
    "${Env:ProgramFiles}\Steam\steamapps\common\assettocorsa"
)

$script:ac_root = 0

function Find-Ac {
    foreach ($path in $common_ac_paths) {
        if (Test-Path -Path $path) {
            Write-Host ''
            $answer = read-host -prompt "Found Assetto Corsa in $path, is this correct? (y/n)"
            if ($answer -eq "y") {
                $script:ac_root = $path
            }
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

$arch_car = 'arch_mazda_miata_na8c_1994'
$arch_folder = "$script:girellu\Releases\Mods\Arch Cars Public\Modified_physics_for_Miata_NA*"
$kunos_car = 'ks_mazda_miata'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_mazda_miata_na8c_1994_s1'
$kunos_car = 'ks_mazda_miata'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_mazda_miata_nd1_2016'
$arch_folder = "$script:girellu\Releases\Mods\Arch Cars Public\Modified_physics_for_Miata_ND*"
$kunos_car = 'ks_mazda_mx5_nd'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_mazda_miata_nd1_2016_s1'
$kunos_car = 'ks_mazda_mx5_nd'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_mazda_fd3s_2002_spiritr'
$arch_folder = "$script:girellu\Releases\Mods\Arch Cars Public\Modified_physics_for_RX7_FD3S*"
$kunos_car = 'ks_mazda_rx7_spirit_r'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_mazda_fd3s_1999_drift'
$kunos_car = 'ks_mazda_rx7_tuned'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'm7_nissan_r34_gtr_1999_vspec'
$arch_folder = "$script:girellu\Releases\Mods\Arch Cars Public\Modified_physics_for_R34 GT-R_V-spec*"
$kunos_car = 'ks_nissan_skyline_r34'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_toyota_ae86_sprinter_trueno_gtapex_1983'
$arch_folder = "$script:girellu\Releases\Mods\Arch Cars Public\Modified_physics_for_AE86_Trueno*"
$kunos_car = 'ks_toyota_ae86'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_toyota_ae86_sprinter_trueno_gtv_1983'
$kunos_car = 'ks_toyota_ae86'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_toyota_ae86_sprinter_trueno_1983_s1'
$kunos_car = 'ks_toyota_ae86'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_toyota_ae86_sprinter_trueno_1983_s2'
$kunos_car = 'ks_toyota_ae86_tuned'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_toyota_ae86_sprinter_trueno_1983_drift'
$kunos_car = 'ks_toyota_ae86_drift'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_toyota_gt86_2015_gt'
$arch_folder = "$script:girellu\Releases\Mods\Arch Cars Public\Modified_physics_for_GT86*"
$kunos_car = 'ks_toyota_gt86'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_toyota_supra_a80_1997_rz'
$arch_folder = "$script:girellu\Releases\Mods\Arch Cars Public\Modified_physics_for_Supra_JZA80*"
$kunos_car = 'ks_toyota_supra_mkiv'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_toyota_supra_a80_1997_drift'
$kunos_car = 'ks_toyota_supra_mkiv_drift'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_bmw_m3_e30_1992_dtm'
$arch_folder = "$script:girellu\Releases\Mods\Arch Cars Public\Modified_physics_for_M3_E30_DTM_*"
$kunos_car = 'bmw_m3_e30_dtm'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_bmw_m3_e30_1986'
$arch_folder = "$script:girellu\Releases\Mods\Arch Cars Public\Modified_physics_for_M3_E30*"
$kunos_car = 'bmw_m3_e30'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_bmw_m3_e30_1986_drift'
$kunos_car = 'bmw_m3_e30_drift'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_bmw_m3_e30_evo3_1990'
$kunos_car = 'bmw_m3_e30'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_mercedes_190e_evoii_1992_dtm'
$arch_folder = "$script:girellu\Releases\Mods\Arch Cars Public\Modified_physics_for_190E_DTM*"
$kunos_car = 'ks_mercedes_190_evo2'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_porsche_911_rsr_1974_grp4'
$arch_folder = "$script:girellu\Releases\Mods\Arch Cars Public\Modified_physics_for_911_RSR_*"
$kunos_car = 'ks_porsche_911_carrera_rsr'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_ruf_ctr_1987'
$arch_folder = "$script:girellu\Releases\Mods\Arch Cars Public\Modified_physics_for_CTR1_*"
$kunos_car = 'ruf_yellowbird'
Install-Car $arch_folder $arch_car $kunos_car $ac_root

$arch_car = 'arch_lotus_elise_sc_tp_2008'
$arch_folder = "$script:girellu\Releases\Mods\Arch Cars Public\Modified_physics_for_Elise*"
$kunos_car = 'lotus_elise_sc'
Install-Car $arch_folder $arch_car $kunos_car $ac_root


$path = -join($ac_root, "\content\cars\", "ks_porsche_935_78_moby_dick");
if (Test-Path -Path $path) {
    $arch_car = 'arch_porsche_935_78_1978_grp5'
    $arch_folder = "$script:girellu\Releases\Mods\Arch Cars Public\Modified_physics_for_935_78*"
    $kunos_car = 'ks_porsche_935_78_moby_dick'
    Install-Car $arch_folder $arch_car $kunos_car $ac_root
} else {
    Write-Host 'Did not find moby dick, skipping install.'
    Exit
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
