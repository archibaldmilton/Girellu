# Natural Mod Filter
Attempt to replicate what the eye sees rather than a camera with no chromatic aberration, lens flares, or erratic autoexposure.

![Screenshot_ks_ferrari_488_gt3_spa_16-10-121-17-11-30](https://user-images.githubusercontent.com/90503800/142789354-a4af7a23-9833-4e44-ac40-7a85f20fd60a.jpg)
![Screenshot_ks_porsche_911_r_ks_nordschleife_18-10-121-17-36-30](https://user-images.githubusercontent.com/90503800/142789355-a04422a0-35dc-4cc7-b064-47022efda4c2.jpg)
![Screenshot_ferrari_458_ks_nordschleife_16-10-121-17-8-5](https://user-images.githubusercontent.com/90503800/142789356-9fd2cd18-b600-4502-bd5e-e8f0b08bb14d.jpg)
![Screenshot_ks_ferrari_488_gtb_ks_brands_hatch_16-10-121-17-17-7](https://user-images.githubusercontent.com/90503800/142789357-a76d039a-5447-4a90-8859-cae2a590e835.jpg)

## Filter Notes
This filter aims to get the best onboard view for driving rather than create photo-real external screenshots, saves approximately 15 FPS over other default filters.

**Natural_Mod:**

Based on the default filter with the main tweaks:
* Camera effects like star shapes, chromatic aberration, vignetting etc. disabled.
* Autoexposure disabled (except when transitioning to night with Sol.)
* Glare tweaked for balanced interior and exterior effects.
* Neutral Colour temperature.
* Subtle tweaks to gamma, brightness, contrast saturation etc.
* Includes Sol custom config.

**Natural_Mod_Photomode:**
* For screenshots only, same as Natural_Mod except tuned to look more like a camera.
	* i.e. high quality DOF effect, shorter godrays, higher contrast, slight vignette.
* Includes Sol custom config.

**Natural_Mod_Base:**
* For users of default WeatherFX implementation (less resource intensive than Sol). Tuned for daytime driving, night time is a bit brighter than I would like, but I don't think filter .lua is possible with default WeatherFX implementation to work around this.

___
**Frequently Asked Questions:**

*"Some tracks are too bright!"*

The filter is tuned to get a dazzling effect when the sun is high in summer, but on some mod tracks with different shader values, this might end up looking way too bright. Assuming you use Sol, use the ta_exp_fix adjustment in the Sol Config app to easily fix these tracks, without compromising others.

*Warning for VR Users:*

If you use Content Manager and VR, ensure that "Override default PP filter in Oculus Rift mode" is ticked. It is recommended to disable Crepuscular Rays/Sunrays in the launcher due to this [issue](http://www.assettocorsa.net/forum/index.php?threads/oculus-1-7-3-godrays-rendered-from-all-angles-rather-than-just-from-sun.34556/ "assettocorsa.net")

*"I want to fine tune my display!"*

If your display has a poor black level (e.g. like the Oculus Quest 2 LCD), you could slightly increase contrast_day or decrease gamma_base or exposure at the top of the .lua file.

*Contrast tuning (for Sol users)*

If your your display's black level is not great, then the filter may look too washed out. Try increasing "contrast_day" in Natural_Mod.lua (I use 0.985 for Oculus Quest 2), or just add 1% to contrast in the Sol Config app.

## Donate: [![](https://img.shields.io/badge/PayPal-eyes1991-169BD7?style=for-the-badge&logo=paypal)](https://paypal.me/ears1991)