!!!IMPORTANT!!!

Shaders patch 0.2.8+ required!

!!!IMPORTANT!!!

Includes:
DTM 1992 E30 M3

Credits:
Physics by Arch
Everything else by Kunos Simulazioni

CHANGELOG

2026-01-02_A
- Changed ABS
- Changed brakes, brake setup

2025-12-29_A
- Changed tires RELAXATION_LENGTH, FRICTION_LIMIT_ANGLE, CX_MULT, FLEX_GAIN

2025-12-27_A
- Removed chassis pitch flex (vibrates)
- Changed ABS
- Changed tires PATCH_TRANSFER

2025-12-06_C
- Corrected missing brakes.ini THERMAL_VERSION=2

2025-12-06_B
- Corrected? rear brake disc thickness

2025-12-06_A
- Actually changed tire thermals for real this time
- Changed brake thermals
- Changed brakes

2025-12-05_A
- Added chassis torsion and pitch stiffness
- Changed tire thermals

2025-11-30_A
- Changed brake thermals
- Changed tire thermals
- Changed CG

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
- Changed CG

2025-05-05_A
- Changed brake booster curve

2025-05-03_A
- Changed tires combined grip
- Changed ABS slip goal, frequency
- Corrected differential

2025-05-01_A
- Changed tires LEVEL, YMULT
- Corrected camber curve lut reference
- Changed aero

2025-04-26_A
- Added preload force
- Changed tires
- Changed ARB
- Changed default setup

2025-04-17_B
- Removed compliant steering rack
- Corrected rear ARB geometry and MR
- Changed default setup

2025-04-17_A
- Changed ARBs

2025-04-16_A
- Changed tires camber curve, load curve
- Changed aero

2025-04-15_A
- Removed 40% Group N differential option
- Changed default setup
- Changed brake setup options

2025-04-14_B
- Corrected differential and differential setup options

2025-04-14_A
- Changed brakes setup adjustability
- Changed ARBs
- Changed INSTALL_K for corners and ARBs
- Fixed typo in front strut bottom
- Minor fixes to brakes

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
- Added steering U-joint nonlinearity (thanks @jpg_18, mod-talk)
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
- Changed tires X_MULT, LEVEL, SPEED, FALLOFF_YSPEED_MULT, combined grip, relax length, SAT, thermal curves
- Changed AI

2024-04-05
- Changed tire relax length, camber curve
- Changed front geometry
- Changed dampers
- Changed unsprung mass
- Changed rear damper travel
- Changed drivetrain
- Changed default setup, rear alignment range, brake balance bar adjustment range
- Corrected brakes.ini TORQUE_K
- Minor file syntax changes

2023-03-25
- Changed front geometry
- Changed stabilizers
- Changed rear damper travel
- Changed default setup, options
- Misc. changes

2024-03-24
- Changed damper travel
	- More compliant over bumps and kerbs
- Changed tire load curves, SAT
- Changed syntax in tyres.ini setup.ini, luts
- Changed UI

2024-03-22
- Changed foldername to arch_dtm_1992_bmw_e30_m3
- Changed tire rate, damping, load curves, SAT
- Changed stabilizers
- Changed helper springs
- Changed dampers
- Changed default alignment
- Changed ABS threshold from 0.16 to 0.14
- Corrected rear bumpstop element reference

2024-03-17
- Raised CGH
- Changed tire rate, damping

2024-03-10
- Changed tire damping
- Changed dampers

2024-03-05
- Changed tire load curves (no performance change)

2024-03-03
- Changed tire damping
- Changed tire rolling resistance
- Changed tire load curves (no performance change)

2024-02-29
- Changed bumpstops

2024-02-26
- Changed tire load curves

2024-02-18
- Initial version