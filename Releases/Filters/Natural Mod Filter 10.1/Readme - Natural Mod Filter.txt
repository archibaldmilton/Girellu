If you want to buy me a beer: http://paypal.me/ears1991

*Install part 1:*
	Set saturation to 100% in AC graphics options
	CSP users: Filter is configured on the assumption that Cars/Tracks configs + VAO are present, they should be automatically downloaded by CM unless you have disabled this.
	Sol/Pure users: : Be sure to follow the Sol/Pure install guides, as sometimes there are important CSP settings such as "Use seasonal adjustments" which drastically alter the look.

*Install part 2:*
	Drag zip into Content Manager (Full version) and install through CM Mod Manager, Enable Natural_Mod Filters
*OR*
	Unzip to the root of your AC install folder, use JSGME (find online) to Enable Natural_Mod Filters
*OR*
	Manually unzip "Natural Mod Fitler x.x.zip\MODS\Natural_Mod Filters\system\" to \assettocorsa\system\

*Install part 3:*
	Follow the instructions corresponding to your AC setup:
	
CSP + Pure (Pure minimum version: 0.102):
	In graphics settings, select filter: Natural_Mod
	Reset Pure Config app to default if you have made any adjustments (other custom filters may have modified settings here too)

CSP + Sol (Sol minimum version: 2.1):
	In graphics settings, select filter: Natural_Mod
	Reset Sol Config app to default if you have made any adjustments (other custom filters may have modified settings here too)

CSP (without Sol):
	In graphics settings, select filter: Natural_Mod_Base

Vanilla AC:
	In graphics settings, select filter: Natural_Mod

Vanilla AC - VR:
	Backup default.ini in SteamApps\common\assettocorsa\system\cfg\ppfilters\
	Rename Natural_Mod.ini to default.ini in SteamApps\common\assettocorsa\system\cfg\ppfilters\
	In graphics settings, select filter: default
	Suggest disabling Crepuscular Rays/Sunrays in the launcher due to this issue: http://www.assettocorsa.net/forum/index.php?threads/oculus-1-7-3-godrays-rendered-from-all-angles-rather-than-just-from-sun.34556/

Warning for VR Users:
	If you use Content Manager and VR, ensure that "Override default PP filter in Oculus Rift mode" is ticked.