## Installation
To install or update the cars, run the script install_arch_cars.ps1 (right click -> Run with PowerShell) and follow instructions within.

If running install_arch_cars.ps1 directly doesn't work, run install_arch_cars.bat instead, it will work exactly the same (the .bat just launches the .ps1). There will probably be a big scary warning when running the .bat script, dismiss it by clicking More options -> Run anyway.

### How does the installation work (what does the script do)?
This repository only contains physics data, not "full" cars (a car mod also needs a 3D model, sounds, ...). The physics data are intended to replace physics of specific cars - "donor cars" (they are "donating" the visuals and sounds).

For each car, the scripts tries to find the corresponding donor car in your AC install, and if you have the car, it applies the physics replacement. Some donor cars are base game content (so made by Kunos Simulazioni - "Kunos cars"), some donor cars are mod cars. The physics replacement works differently between these:
* For Kunos cars, the script **creates a copy** of the donor car, and applies the physics replacement to this copy. So the result is two identically looking cars, but with different folder names, UI information and physics. (You can use the version field in car details to distinguish them, the copies will have Arch listed as author.)
* For mod cars, the script doesn't create copies, it directly replaces the physics of the existing car (in other words, it just **updates the mod** to a newer physics version). So the car will look the same as before, the only visible change will be the version field.

### The script says "Could not find donor car ...", what do I do?
If you don't care about that particular car, just ignore the message (the script will still install other cars just fine).

If you do want that car, you need to get the donor car (and then run the install script again):
* If the donor car you are missing is a Kunos car (like `ks_toyota_ae86` or `ks_bmw_m4`), it's presumably a DLC car. Find which car pack the car is from and get that DLC.
* If the donor car you are missing is a mod car (like `some1_honda_nsx_1991` or `corvette_c6_coupe`), read the corresponding car-specific README (in the [CHANGELOGS](CHANGELOGS) folder), you'll find a link to the needed mod at the top. Download and install that mod (these are "normal" mod cars).

# Arch Modified Physics
> Minimum CSP version is 0.2.3
### COSMIC notes
* Most Arch cars have been updated to COSMIC suspension type. To know about more COSMIC suspension type, click [here](https://github.com/ac-custom-shaders-patch/acc-extension-config/wiki/Cars-%E2%80%93-Cosmic-Suspension "GitHub").
* Non-COSMIC suspension data are moved to the legacy folder for archival purposes and thereby will no longer receive support.

___
#### Additional notes
* For other Arch mods, check [ARCH_OTHER.md](./ARCH_OTHER.md).
* If you want to use Arch physics for something else, refer to the [license](./LICENSE.md).
* Support is not promised; if there is a technical issue, it is user error.
* No guarantee for satisfactory user experience unless using appropriate professional simulation peripherals with [correct configuration](https://github.com/archibaldmilton/Girellu/wiki/AC-Startup-Guide#force-feedback-ffb). 
	- For example, your G29 @ 30FPS can not keep up with the rotation speed of these cars.
