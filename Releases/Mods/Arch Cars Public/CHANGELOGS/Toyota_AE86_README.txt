!!!IMPORTANT!!!

Shaders patch 0.2.3+ required! Requires JDM Pack DLC by Kunos!

!!!IMPORTANT!!!

Includes:
AE86 1600GTV Sprinter Trueno
AE86 Sprinter Trueno Drift

Credits:
Physics by Arch
Everything else by Kunos Simulazioni

Special thanks:
Venitros for driving car in testing
Aphidgod, stereo, mclarenf1papa, Leonardo Ratafiá, Kade and many others for help
baker7498 for finding a ton of data

CHANGELOG

2025-07-11_A
- Changed tires PRACTICAL_TEMP_RATIO, thermals, slip

2025-07-04_A
- Changed autoshifting, gearbox parameters

2025-06-29_A
- Changed RE86 load curves
- Changed clutch torque

2025-06-21_A
- Changed tires rolling resistance, SAT

2025-06-12_A
- Changed tires load, slip, pressure

2025-05-25_A
- Changed COMBINED_FACTOR

2025-05-24_A
- Changed brake heat
- Corrected "bushings" to act as pull springs

2025-05-19_A
- Changed GLOBA load curves, wear curves, various parameters
- Corrected RE710 wear curves
- Corrected RE86 vertical stiffness

2025-05-17_A
- Changed tires load curve

2025-05-16_A
- Changed aero

2025-05-14_A
- Changed tires CX_MULT
- Corrected RR_UCA definitions

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

2025-04-07_A
- Updated engines for better idle handling
- Updated script.lua to fix? idle/coast? bug again

2025-04-06_A
- Changed Drift rack mass, damping
- Changed bushings
- Changed GTV front bumpstop

2025-03-29_A
- Changed script.lua to fix autoblip issue
- Changed brakes effective radius, booster, thermals

2025-03-08_A
- Changed brakes

2025-03-03_A
- Added LUA throttle, idle, coast model by @switchpro, @ustahl, @jpg_18
- Corrected brake pressure
- Changed handbrake torque

2025-02-11_A
- Added bushing vertical damping
- Changed bushing vertical rates
- Changed stabilizer installation stiffness
- Changed GTV R_AE86_UCA_RR stiffness
- Simplified rear geometry

2025-01-14_A
- Added hard rate point to steering rack lateral deflection
- Changed tires

2024-12-30_A
- Added 10m/s point to damper luts
- Added steering rack lateral deflection to Drift
- Removed chassis torsion flex
- Changed tire slip, load, camber, SAT
- Changed corner spring installation stiffness
- Fixed Drift backwards front damper rebound setup

2024-10-15_A
- Changed reference brake foot force from 50kgf to 100kgf, setup max to 100%
- Changed brakes

2024-09-20
- Changed reference brake foot force from 100kgf to 50kgf, setup max to 200%
- Changed tires heat, slip, load, wear etc.
- Changed "OEM" brake friction curve
- Changed stabilizers

2024-08-15
- Added steering U-joint nonlinearity (thanks @jpg_18, mod-talk)
- Changed tire thermals

2024-08-09
- Reverted from force to slip relax length
- Changed tire SAT, FALLOFF_SPEED, FALLOFF_YSPEED_MULT, FLEX_GAIN, heat_mu

2024-07-21
- Changed tires slip, heat

2024-07-10
- Changed tires camber curve

2024-06-08
- Corrections

2024-05-31
- Changed Drift tires from RE710 to RE710 / GLOBA
- Changed tires X_MULT, LEVEL, SPEED, FALLOFF_YSPEED_MULT, rolling resistance

2024-05-29
- Changed tires slipcurve, combined grip, relax length, SAT
- Corrections

2024-05-09
- Added damper to R_AE86_UCA_RR
- Increased rate of R_AE86_UCA_RR SPRING
- Corrections

2024-04-05
- Fixed typo in Drift suspensions.ini front geometry hints

2024-03-22
- Changed tire damping

2024-03-17
- Changed tire damping
- Changed tire rolling resistance

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

2024-02-29
- Changed bumpstops

2024-02-26
- Changed tire load curves

2024-02-25
- Changed tire load curves, combined grip, camber_spring_k

2024-01-29
- Added wider brake torque range in setup.ini that I forgot to add

2024-01-27
- Changed foldernames
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
- Changed tire SAT
- Changed steering ratios, nonlinearities

(2023-11-17)
- Changed Drift UI

2023-11-14
- Added ackerman steering setup to Drift
- Changed toe setup from rack translation (vanilla) to steer rod length (Cosmic) where appropriate
- Changed syntax of setup options

2023-11-12
- Added gearset 33030-AE861 and final gears 41201-TA001, 41201-TA002 to Drift
- Changed tire load curves
- Changed tire heat
- Changed brake heat
- Changed BASEY
- Changed bumpstops
- Changed car.ini steering hints
- Simplified rear AXLE Joint structure
- Changed name of rear panhard adjustment options in setup.ini
- Changed syntax of setup .luts
- Changed suspensions.ini syntax from POS0 to POS_A etc.

2023-08-06
- Added multiple loadpoint tire model
- Changed load, slip, combined grip, SAT, wear
- Changed tire thermal model version, temperature load biasing

2023-07-09
- Changed some BODY masses from 0.1kg to 1.0kg to prevent vibrations
- Changed suspensions.ini syntax
- Changed setup.ini syntax

2023-07-08
- First COSMIC version, CSP 1.80+ compatibility only!
- Added object-based alignment, springs, dampers etc.
- Added chassis torsion flex
- Changed Drift steering knuckle geometry
- Corrected steering ratios/linearity