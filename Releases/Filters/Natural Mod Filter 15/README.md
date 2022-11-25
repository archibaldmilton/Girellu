# Natural Mod Filter
Replicate what the naked eye sees with modesty.

![1Screenshot_ferrari_458_ks_nordschleife_22-10-122-20-58-6](https://user-images.githubusercontent.com/90503800/203888967-941b8478-0b09-4656-a89b-57880f3a78c0.jpg)
![Screenshot_ferrari_458_ks_nordschleife_22-10-122-20-42-51](https://user-images.githubusercontent.com/90503800/203888969-57617025-163b-4d6d-b60a-ad30e9589522.jpg)
![Screenshot_ferrari_458_ks_nordschleife_22-10-122-20-53-29](https://user-images.githubusercontent.com/90503800/203888970-d155a731-9abf-4c46-bb11-91db754a0e1b.jpg)

## Filter Notes
Driving focused filter with no chromatic aberration, lens flare, or erratic autoexposure. Improved FPS over default Kunos filters.

When used in Pure, the filter is able to avoid immersion-breaking brightness changes while retaining dynamism.

*VR User warning:*
>If you use VR and Content Manager, ensure that "Override default PP filter in Oculus Rift mode" is ticked. It is recommended to disable Crepuscular Rays/Sunrays in the launcher due to this [issue](http://www.assettocorsa.net/forum/index.php?threads/oculus-1-7-3-godrays-rendered-from-all-angles-rather-than-just-from-sun.34556/ "assettocorsa.net").

**Natural_Mod:**

Based on the default filter with the main tweaks:
* Camera effects like star shapes, chromatic aberration, vignetting etc. disabled.
* Autoexposure disabled (except when transitioning to night with Sol.)
* Glare tweaked for balanced interior and exterior effects.
* Neutral Color temperature.
* Subtle tweaks to gamma, brightness, contrast saturation etc.
* Includes Sol and Pure custom config.

**Natural_Mod_Photomode:**
* For screenshots only, same as Natural_Mod except tuned to look more like a camera.
	* i.e. high quality DOF effect, shorter godrays, higher contrast, slight vignette.
* Includes Sol and Pure custom config.

**Natural_Mod_Base:**
* For users of default implementation weather script. Tuned for daytime driving, night time is a bit brighter than I would like, but I don't think filter .lua is possible with default WeatherFX implementation to work around this.

___
**Frequently Asked Questions:**

*"Some tracks are too bright!"*

The filter is tuned to get a dazzling effect when the sun is high in summer, but on some mod tracks with different shader values, this might end up looking way too bright. Assuming you use Sol, use the ta_exp_fix adjustment in the Sol Config app to easily fix these tracks, without compromising others.

*"I want to fine tune my display!"*

If your display has a poor black level (e.g. like the Oculus Quest 2 LCD), you could slightly increase contrast_day or decrease gamma_base or exposure at the top of the .lua file.

*Contrast tuning (for Sol users)*

If your display's black level is not great, then the filter may look too washed out. Try increasing "contrast_day" in Natural_Mod.lua (I use 0.985 for Oculus Quest 2), or just add 1% to contrast in the Sol Config app.

## Donate: [![](https://img.shields.io/badge/PayPal-eyes1991-169BD7?style=for-the-badge&logo=paypal)](https://paypal.me/ears1991)
