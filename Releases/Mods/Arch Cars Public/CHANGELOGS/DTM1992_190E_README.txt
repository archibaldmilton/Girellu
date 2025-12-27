!!!IMPORTANT!!!

Shaders patch 0.2.8+ required!

!!!IMPORTANT!!!

Includes:
DTM 1992 190E

Credits:
Physics by Arch
Everything else by Kunos Simulazioni

CHANGELOG

2025-12-27_A
- Removed chassis pitch flex (vibrates)
- Changed ABS
- Changed tires PATCH_TRANSFER

2025-12-13_A
- Corrected chassis flex damper positions

2025-12-06_C
- Corrected missing brakes.ini THERMAL_VERSION=2

2025-12-06_B
- Corrected? rear brake disc thickness

2025-12-06_A
- Actually changed tire thermals for real this time
- Changed brake thermals

2025-12-05_A
- Added chassis torsion and pitch stiffness
- Changed tire thermals

2025-11-30_A
- Changed brake thermals
- Changed tire thermals

2025-11-24_A
- Changed tire thermals

2025-11-16_A
- Changed tire rolling radius speed and load sensitivity
- Changed tire load curves, core temperature coefficients
- Changed ABS
- Changed dampers
- Changed autoshifter

2025-11-07_A
- Changed tire slip, camber, load, temp sensitivity
- Changed front coilover installation stiffness
- Changed ABS
- Changed PS

2025-07-29_A
- Changed tires thermals, slip

2025-07-11_A
- Changed tires PRACTICAL_TEMP_RATIO, thermals, slip

2025-07-04_B
- Added missing brake friction lut

2025-07-04_A
- Changed autoshifting, gearbox parameters

2025-06-21_A
- Changed tires rolling resistance

2025-06-12_A
- Changed tires load, slip

2025-05-25_A
- Changed COMBINED_FACTOR

2025-05-24_A
- Changed brake heat

2025-05-17_A
- Changed tires load curve

2025-05-16_A
- Changed ABS
- Changed aero

2025-05-14_B
- Changed stabilizers

2025-05-14_A
- Added Cphys ABS (CSP 0.2.8+ required!)
- Changed tires CX_MULT

2025-05-05_A
- Changed brake booster curve

2025-05-03_A
- Changed tires combined grip
- Changed ABS slip goal, frequency

2025-05-01_A
- Changed tires LEVEL, YMULT
- Corrected camber curve lut reference

2025-04-26_A
- Changed tires
- Changed ARB
- Changed brakes
- Changed default setup

2025-04-17_B
- Removed compliant steering rack
- Calculated front and rear ARBs
- Changed spring setup options
- Changed default setup

2025-04-17_A
- Changed ARBs

2025-04-16_A
- Removed LUT_GH_CD
- Changed tires camber curve, load curve

2025-04-15_A
- Changed differential

2025-04-14_A
- Removed brake booster
- Changed brake master cylinder to tandem type
- Changed brakes setup adjustability
- Changed ARBs
- Changed INSTALL_K for corners and ARBs

2025-04-07_A
- Updated engines for better idle handling
- Updated script.lua to fix? idle/coast? bug again

2025-04-06_A
- Changed rack mass, damping

2025-03-29_A
- Changed script.lua to fix autoblip issue

2025-03-08_A
- Changed brakes
- Changed ABS slipratio goal

2025-03-03_A
- Added LUA throttle, idle, coast model by @switchpro, @ustahl, @jpg_18
- Corrected brake pressure

2025-01-28_A
- Removed hard rate from steering rack lateral deflection, problematic

2025-01-18_B
- Expanded range of steering rack lateral deflection soft rate to band-aid exploding in pits

2025-01-14_A
- Added hard rate point to steering rack lateral deflection
- Changed tires

2024-12-30_A
- Added 10m/s point to damper luts
- Added steering rack lateral deflection
- Removed chassis torsion flex
- Changed tire slip, camber
- Changed corner spring installation stiffness

2024-09-20
- Changed reference brake foot force from 100kgf to 50kgf, setup max to 200%
- Changed tires heat, slip, load, wear etc.
- Changed ABS

2024-08-15
- Changed tire thermals

2024-08-09
- Reverted from force to slip relax length
- Changed tire SAT, FALLOFF_SPEED, FALLOFF_YSPEED_MULT, FLEX_GAIN, heat_mu


2024-07-31
- Changed SAT

2024-07-21
- Changed tires slip, heat

2024-07-10
- Changed tires camber curve

2024-05-31
- Changed PS
- Changed tires X_MULT, LEVEL, SPEED, FALLOFF_YSPEED_MULT, combined grip, relax length, SAT, thermal curves
- Changed AI

2024-04-05
- Changed tire relax length
- Changed dampers
- Changed unsprung mass
- Changed brake balance bar adjustment range
- Changed default setup
- Corrected brakes.ini TORQUE_K
- Minor file syntax changes

2023-03-25
- Changed tire camber curve
- Changed stabilizers
- Changed default setup, options

2024-03-24
- Changed damper travel
	- More compliant over bumps and kerbs
- Changed tire load curves, SAT
- Changed syntax in tyres.ini setup.ini, luts
- Changed UI

2024-03-22
- Initial version