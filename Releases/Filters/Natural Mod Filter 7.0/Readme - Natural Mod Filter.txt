Attempt to replicate what the eye sees rather than a camera, to get the best onboard view for driving rather than create photo-real external screenshots. No chromatic aberration, lens flares or erratic autoexposure. Saves approximately 15fps over the default filters.

If you want to buy me a beer: http://paypal.me/ears1991

Updating/Uninstalling:
To make sure updating/uninstalling the mod is easy, I suggest using JSGME or Content Manager to install the mod

Install:
Set saturation to 100% in graphics options
Unzip to the root of your AC install folder OR drag into Content Manager, then follow the instructions corresponding to your AC setup:

Content Manager + CSP + Sol (Sol minimum version: 2.1 alpha 12 (tested on alpha 24) (from https://discord.gg/KeHxbSX)):
	Enable Natural_Mod Filters. In graphics settings, Select Filter: Natural_Mod
	It may be worth resetting your settings in the Sol Config app if you have made any adjustments and start fresh.
	In Sol Config app, I use the "High" Performance Preset and clouds render method 0 (2d). 3d clouds are getting there but not perfect in all scenarios yet.
	Also check Peter's recommended settings for Lighting FX, Brightness and "Cars lit multiplier" in particular.

Content Manager + CSP:
	Natural_Mod Filters. In graphics settings, Select Filter: Natural_Mod_Base

Vanilla AC:
	Using JSGME or manually copying the files, enable Natural_Mod Filters
	In graphics settings, Select Filter: Natural_Mod

Vanilla AC - VR:
	Backup default.ini from SteamApps\common\assettocorsa\system\cfg\ppfilters\
	Rename Natural_Mod.ini to default.ini and place it in SteamApps\common\assettocorsa\system\cfg\ppfilters\
	In graphics settings, Select Filter: default

Warning for VR Users:
	If you use Content Manager and VR, ensure that "Override default PP filter in Oculus Rift mode" is ticked.
	Suggest disabling Crepuscular Rays/Sunrays in the launcher due to this issue: http://www.assettocorsa.net/forum/index.php?threads/oculus-1-7-3-godrays-rendered-from-all-angles-rather-than-just-from-sun.34556/

Fine tune to your display/VR headset
	If your display has a poor black level (e.g. like the Oculus Quest 2 LCD), you could slightly increase contrast_day or decrease gamma_base or exposure at the top of the .lua file.

Filter Descriptions:
Natural_Mod:
	Based on the default with the main tweaks as follows:
	Camera effects like star shapes, chromatic aberration, vignetting etc. disabled
	Autoexposure disabled (except when transitioning to night with Sol)
	Glare tweaked for balanced interior and exterior effects
	Neutral Colour temperature
	Subtle tweaks to gamma, brightness, contrast saturation etc.
	Includes Sol custom config

Natural_Mod_Photomode:
	For screenshots only, same as Natural_Mod except tuned to look more like a camera e.g. high quality DOF effect, shorter godrays, higher contrast, slight vignette
	Includes Sol custom config

Natural_Mod_Base:
	For users of default WeatherFX implementation (less resource intensive than Sol). Tuned for daytime driving, night time is a bit brighter than I would like, but I don't think filter .lua is possible with default WeatherFX implementation to work around this.

Some tracks are too bright!:
	The filter is tuned to get a dazzling effect when the sun is high in summer, but on some mod tracks with different shader values, this might end up looking way too bright. Assuming you use Sol, use the ta_exp_fix adjustment in the Sol Config app to easily fix these tracks, without compromising others.