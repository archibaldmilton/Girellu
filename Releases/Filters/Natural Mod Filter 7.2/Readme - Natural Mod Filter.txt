Attempt to replicate what the eye sees rather than a camera, to get the best onboard view for driving rather than create photo-real external screenshots. No chromatic aberration, lens flares or erratic autoexposure. Saves approximately 15fps over the default filters.

If you want to buy me a beer: http://paypal.me/ears1991

*Install part 1:*
	Set saturation to 100% in graphics options
	Drag zip into Content Manager (Full version) and install through CM Mod Manager, Enable Natural_Mod Filters
	*OR*
	Unzip to the root of your AC install folder, run JSGME.exe, Enable Natural_Mod Filters
	*OR*
	Manually unzip "Natural Mod Fitler x.x.zip\MODS\Natural_Mod Filters\system\" to \assettocorsa\system\

*Install part 2 - follow the instructions corresponding to your AC setup:*
CSP + Sol (Sol minimum version: 2.1. Recommend 2.2):
	In graphics settings, select filter: Natural_Mod
	Reset Sol Config app to default if you have made any adjustments

CSP (without Sol):
	In graphics settings, select filter: Natural_Mod_Base

Vanilla AC:
	In graphics settings, select filter: Natural_Mod

Vanilla AC - VR:
	Backup default.ini in SteamApps\common\assettocorsa\system\cfg\ppfilters\
	Rename Natural_Mod.ini to default.ini in SteamApps\common\assettocorsa\system\cfg\ppfilters\
	In graphics settings, select filter: default

Warning for VR Users:
	If you use Content Manager and VR, ensure that "Override default PP filter in Oculus Rift mode" is ticked.
	Suggest disabling Crepuscular Rays/Sunrays in the launcher due to this issue: http://www.assettocorsa.net/forum/index.php?threads/oculus-1-7-3-godrays-rendered-from-all-angles-rather-than-just-from-sun.34556/

*Filter Descriptions:*
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