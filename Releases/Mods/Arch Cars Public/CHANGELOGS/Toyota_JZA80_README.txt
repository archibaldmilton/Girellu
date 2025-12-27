!!!IMPORTANT!!!

Shaders patch 0.2.8+ required! Requires JDM Pack DLC by Kunos!

!!!IMPORTANT!!!

Includes:
JZA80 RZ
JZA80 Drift

Credits:
Physics by Arch
Everything else by Kunos Simulazioni

Special thanks:
Aad Hofman for providing original laserscanned suspension
baker7498 for providing lots of data and literature

CHANGELOG

2025-12-27_A
- Removed chassis pitch flex (vibrates)
- Changed ABS
- Changed tires PATCH_TRANSFER

2025-12-13_A
- Corrected chassis flex damper positions

2025-12-05_A
- Added chassis torsion and pitch stiffness
- Changed brake thermals
- Changed tire thermals
- Changed Drift damper rebound high speed
- Changed Drift default setup

2025-11-30_A
- Changed brake thermals
- Changed tire thermals
- Changed PS

2025-11-25_A
- Changed tire load curves

2025-11-24_A
- Changed tire thermals
- Changed brake thermals

2025-11-16_A
- Changed tire rolling radius speed and load sensitivity
- Changed ABS

2025-11-07_A
- Changed tire slip, camber, load sensitivity
- Changed PS
- Removed ABS slip_diff_lat, slip_diff_axle controllers for now

2025-07-29_A
- Changed tires thermals, slip

2025-07-14_A
- Reverted tires FRICTION_K, SURFACE_ROLLING_K

2025-07-11_A
- Changed tires PRACTICAL_TEMP_RATIO, thermals, slip

2025-07-04_A
- Changed autoshifting, gearbox parameters

2025-06-29_A
- Changed clutch torque

2025-06-21_A
- Changed tires rolling resistance, SAT

2025-06-17_A
- Changed RZ ABS, EBB
- Changed 08D load curves, rolling resistance
- Corrected bushing preload

2025-06-12_A
- Changed tires load, slip, pressure

2025-06-04_A
- Added ABS uneven friction logic

2025-05-25_A
- Added ABS XG sensor
- Changed COMBINED_FACTOR
- Changed TC
- Changed PS

2025-05-24_A
- Changed brake heat
- Corrected "bushings" to act as pull springs

2025-05-18_B
- Corrected steering ratio, rack width

2025-05-17_A
- Changed tires load curve

2025-05-16_A
- Changed ABS
- Changed aero

2025-05-14_A
- Added engine flow on cut
- Added Cphys ABS (CSP 0.2.8+ required!)
- Changed EBB
- Changed PS
- Changed tires CX_MULT
- Corrected welded diff setup option

2025-05-05_A
- Changed load curve mu
- Changed brake booster curve

2025-05-03_A
- Changed tires combined grip
- Changed ABS slip goal, frequency

2025-05-01_A
- Changed tires LEVEL, YMULT
- Changed handbrake
- Removed Drift compliant rack

2025-04-28_A
- Changed tires

2025-04-16_A
- Removed LUT_GH_CD
- Fixed RZ wrong tire wear file reference

2025-04-07_A
- Updated engines for better idle handling
- Updated script.lua to fix? idle/coast? bug again

2025-04-06_A
- Changed Drift rack mass, damping
- Changed bushings

2025-03-29_A
- Changed script.lua to fix autoblip issue

2025-03-08_A
- Changed brakes
- Changed ABS slipratio goal

2025-03-03_A
- Added LUA throttle, idle, coast model by @switchpro, @ustahl, @jpg_18
- Corrected brake pressure
- Corrected Drift brake master cylinder size
- Changed handbrake torque
- Changed RZ engine
- Changed RZ tire load curves
- Changed RZ ABS slipratio goal
- Changed CGH

2025-02-11_A
- Added bushing vertical damping
- Changed bushing vertical rates
- Changed stabilizer installation stiffness

2025-01-29_A
- Recalibrated load curve grip for RE020

2025-01-14_A
- Added hard rate point to steering rack lateral deflection
- Changed tires

2024-12-30_A
- Added 10m/s point to damper luts
- Added steering rack lateral deflection to Drift
- Removed chassis torsion flex
- Changed tire slip, load, camber, SAT
- Changed corner spring installation stiffness
- Changed Drift springs, dampers

2024-10-21_A
- Changed RZ LSD

2024-10-15_A
- Changed brakes

2024-09-20
- Changed reference brake foot force from 100kgf to 50kgf, setup max to 200%
- Changed tires heat, slip, load, wear etc.
- Changed ABS, EBB, TC
- Changed stabilizers
- Changed PS
- Changed Drift default setup

2024-08-15
- Added steering U-joint nonlinearity (thanks @jpg_18, mod-talk)
- Changed tire thermals
- Changed TC

2024-08-09
- Reverted from force to slip relax length
- Changed tire SAT, FALLOFF_SPEED, FALLOFF_YSPEED_MULT, FLEX_GAIN, heat_mu
- Changed PS

2024-07-21
- Changed tires slip, heat

2024-07-10
- Changed tires camber curve

2024-06-08
- Changed Drift dampers

2024-05-31
- Changed Drift tires from Z1SS to 08D
- Changed tires X_MULT, LEVEL, SPEED, FALLOFF_YSPEED_MULT

2024-05-29
- Changed PS
- Changed tires slipcurve, combined grip, relax length, SAT

2024-05-22
- Changed rear geometry slightly
- Changed installation stiffness
- Corrections

2024-03-22
- Changed tire damping

2024-03-17
- Changed tire damping

2024-03-10
- Changed tire damping

2024-03-05
- Changed tire load curves (no performance change)
- Changed Drift UI

2024-03-03
- Changed tire damping
- Changed tire rolling resistance
- Changed tire load curves (no performance change)
- Changed Drift default damping settings
- Changed Drift wheel offset

2024-02-29
- Changed bumpstops

2024-02-26
- Changed tire load curves

2024-02-25
- Changed tire load curves, combined grip, camber_spring_k

2024-01-29
- Added wider brake torque range in setup.ini that I forgot to add

2024-01-27
- Added extended brakes system, realfeel
- Added booster servo saturation to torque calculation
- Calibrated brakes to 100kgf pedal
- Changed tire and brake thermals

2024-01-18
- Changed tire slip, load parameters

2023-12-24
- Added back Drift (Use CSP 0.2.2+)
- Changed tire thermal model to 1 (Less buggy)

2023-11-23
- Removed Drift
- Changed PS curve
- Changed tire SAT

2023-11-17
- Changed Drift steering geometry
- Changed Drift steering ratio (For more correct FFB)
- Changed Drift tire name
- Changed syntax of suspensions.ini
- Changed syntax of setup.ini
- Corrected error in Drift suspensions.ini HOOKES BODY_A reference

2023-11-16
- Added ackerman steering setup to Drift
- Changed toe setup from rack translation (vanilla) to steer rod length (Cosmic) where appropriate
- Changed syntax of setup options
- Changed tire load curves
- Changed tire heat
- Changed brake heat
- Changed suspensions.ini syntax from POS0 to POS_A etc.
- Removed Front FLCA, Rear RLCA adjustment from Drift (CPU use optimization)
- Disabled ABS in Drift
- Corrections to alignment

2023-08-06
- Added multiple loadpoint tire model
- Changed load, slip, combined grip, SAT, wear
- Changed tire thermal model version, temperature load biasing
- Corrections to positions of control arm BODYs
- Changed alignment setup ranges

2023-07-09
- Added Rear FLCA length adjustability to Drift for tweaking bumpsteer
- Added universal joint RLCA_HOOKES to RLCA_BODY to prevent rotation of RLCA_BODY
- Fixed naming issue of RLCA_BODY_2 in Drift, restored functionality of RLCA adjustment
- Changed some BODY masses from 0.1kg to 1.0kg to prevent vibrations
- Changed suspensions.ini syntax
- Changed setup.ini syntax

2023-07-08
- First COSMIC version, CSP 1.80+ compatibility only!
- Added object-based alignment, springs, dampers etc.
- Added chassis torsion flex
- Changed RZ front bumpstop gap, damper stroke
- Changed Drift spring options, default setup