!!!IMPORTANT!!!

Shaders patch 0.2.3+ required! Requires JDM Pack DLC by Kunos!

!!!IMPORTANT!!!

Includes:
Nissan 370Z NISMO
Nissan 370Z Drift

Credits:
Physics by Arch
Everything else by Kunos Simulazioni

Special thanks:
The usual suspects

RECOMMENDED VISUALS AND SOUND

370Z NISMO = KS 370Z NISMO
370Z Drift = KS 370Z NISMO

CHANGELOG

2025-05-03_A
- Changed tires combined grip
- Changed ABS slip goal, frequency

2025-05-01_A
- Changed tires LEVEL, YMULT
- Changed handbrake
- Removed Drift compliant rack

2025-04-27_B
- Changed tires
- Changed PS
- Changed Drift default setup

2025-04-07_A
- Updated engines for better idle handling
- Updated script.lua to fix? idle/coast? bug again

2025-04-06_A
- Changed Drift rack mass, damping
- Changed bushings

2025-03-29_A
- Changed script.lua to fix autoblip issue
- Changed brake booster

2025-03-08_A
- Changed brakes
- Changed ABS slipratio goal

2025-03-03_A
- Added LUA throttle, idle, coast model by @switchpro, @ustahl, @jpg_18
- Corrected brake pressure
- Changed handbrake torque
- Changed NISMO tire load curves

2025-02-11_A
- Added bushing vertical damping
- Changed bushing vertical rates
- Changed stabilizer installation stiffness

2025-01-14_A
- Added hard rate point to steering rack lateral deflection
- Changed tires

2024-12-30_A
- Added 10m/s point to damper luts
- Added steering rack lateral deflection to Drift
- Added Drift caster adjustability
- Removed chassis torsion flex
- Changed tire slip, load, camber, SAT
- Changed corner spring installation stiffness
- Changed PS

2024-10-15_A
- Changed rear suspension geometry, stabilizer
- Changed brakes
- Changed Nismo diff
- Misc. corrections to Drift setup.ini

2024-09-20
- Changed reference brake foot force from 100kgf to 50kgf, setup max to 200%
- Changed tires heat, slip, load, wear etc.
- Changed ABS, EBD, TC
- Changed stabilizers
- Changed Drift default setup

2024-08-15
- Added steering U-joint nonlinearity (thanks @jpg_18, mod-talk)
- Changed tire thermals
- Changed NISMO tire load curve
- Changed NISMO TC

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
- Changed installation stiffness
- Changed suspensions.ini syntax
- Corrections

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
- Changed Drift wheel offset

2024-02-29
- Changed bumpstops

2024-02-26
- Changed tire load curves, combined grip, camber_spring_k

2024-01-29
- Added wider brake torque range in setup.ini that I forgot to add

2024-01-27
- Added extended brakes system, realfeel
- Added booster servo saturation to torque calculation
- Calibrated brakes to 100kgf pedal
- Changed tire and brake thermals

2024-01-20
- Corrected bug in Drift tire speed curve

2024-01-18
- Changed tire slip, load parameters

2023-12-24
- Added back Drift (Use CSP 0.2.2+)
- Changed tire thermal model to 1 (Less buggy)
- Removed nonfunctional UBJ (Caster) adjustment

2023-12-19
- Actually remembered to include the updated files

2023-12-18
- Changed front geometry
- Changed PS curve

2023-11-23
- Removed Drift
- Changed PS curve
- Changed tire SAT

2023-11-17
- Added ackerman steering setup to Drift
- Changed steering ratio
- Changed toe setup from rack translation (vanilla) to steer rod length (Cosmic) where appropriate
- Changed syntax of setup options
- Changed tire load curves
- Changed tire heat
- Changed brake heat
- Changed suspensions.ini syntax from POS0 to POS_A etc.
- Removed Rear RLCA adjustment from Drift (CPU use optimization)

2023-08-06
- First COSMIC version, CSP 1.80+ compatibility only!
- Added object-based alignment, springs, dampers etc.
- Added chassis torsion flex
- Added multiple loadpoint tire model
- Changed load, slip, combined grip, SAT, wear
- Changed tire thermal model version, temperature load biasing
- Changed NISMO rear bumprubber length, rate
- Changed Drift front geometry, spring options, default setup