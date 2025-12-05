!!!IMPORTANT!!!

Shaders patch 0.2.8+ required! Requires 180SX by Lenny!
Link: https://www.youtube.com/watch?v=sPabzoB_LUs

!!!IMPORTANT!!!

Includes:
180SX Type-X
180SX Drift

CHANGELOG

2025-12-05_C
- Changed tire load curves

2025-12-05_A
- Added chassis torsion and pitch stiffness
- Changed brake thermals
- Changed tire thermals
- Fixed syntax errors left over from testing

2025-11-30_A
- Changed brake thermals
- Changed tire thermals

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
- Changed VLSD
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
- Changed RE71 load curves

2025-06-21_A
- Changed tires rolling resistance, SAT

2025-06-17_A
- Changed 08D load curves, rolling resistance
- Corrected bushing preload

2025-06-12_A
- Changed tires load, slip, pressure

2025-06-04_A
- Added ABS uneven friction logic

2025-05-30_A
- Changed suspensions.ini syntax

2025-05-25_A
- Changed COMBINED_FACTOR

2025-05-24_A
- Changed brake heat
- Corrected "bushings" to act as pull springs

2025-05-19_A
- Changed RE71 load curves, rolling resistance

2025-05-17_A
- Changed tires load curve

2025-05-16_A
- Changed ABS
- Changed aero

2025-05-14_A
- Added Cphys ABS (CSP 0.2.8+ required!)
- Changed tires CX_MULT
- Corrected welded diff setup option

2025-05-05_A
- Changed brake booster curve

2025-05-03_A
- Changed tires combined grip
- Changed ABS slip goal, frequency

2025-05-01_A
- Changed tires LEVEL, YMULT
- Changed handbrake
- Removed Drift compliant rack

2025-04-28_A
- Fixed Drift tires.ini camber lut reference

2025-04-27_A
- Changed tires

2025-04-07_A
- Updated engines for better idle handling
- Updated script.lua to fix? idle/coast? bug again

2025-04-06_A
- Changed Drift rack mass, damping
- Changed bushings

2025-03-29_A
- Changed script.lua to fix autoblip issue
- Changed front transverse link height
- Changed PS
- Changed aero

2025-03-18_A
- Changed clutch torque

2025-03-08_A
- Changed brakes
- Changed ABS slipratio goal

2025-03-03_A
- Added LUA throttle, idle, coast model by @switchpro, @ustahl, @jpg_18
- Corrected brake pressure
- Changed handbrake torque
- Updated Drift data.acd, missing from last update

2025-02-11_A
- Added bushing vertical damping
- Changed bushing vertical rates
- Changed stabilizer installation stiffness

2025-01-28_A
- Restored Drift front ackermann adjustment

2025-01-14_A
- Added hard rate point to steering rack lateral deflection
- Changed tires

2024-12-30_A
- Added 10m/s point to damper luts
- Added steering rack lateral deflection to Drift
- Removed chassis torsion flex
- Changed tire slip, load, camber, SAT
- Changed corner spring installation stiffness

2024-10-15_A
- Changed brakes
- Changed Type-X diff
- Changed Drift unsprung mass

2024-09-20
- Changed reference brake foot force from 100kgf to 50kgf, setup max to 200%
- Changed tires heat, slip, load, wear etc.
- Changed "OEM" brake friction curve
- Changed ABS
- Changed stabilizers

2024-08-15
- Added steering U-joint nonlinearity (thanks @jpg_18, mod-talk)
- Changed tire thermals

2024-08-09
- Reverted from force to slip relax length
- Changed tire SAT, FALLOFF_SPEED, FALLOFF_YSPEED_MULT, FLEX_GAIN, heat_mu
- Changed PS

2024-07-21
- Changed tires slip, heat

2024-07-10
- Changed tires camber curve
- Changed suspensions.ini syntax
- Corrected Type-X CAMBER_RF hint reference

2024-06-08
- Corrections

2024-06-01
- Removed front elastokinematic toe compliance (FFB vibration)

2024-05-31
- Changed tires X_MULT, LEVEL, SPEED, FALLOFF_YSPEED_MULT, relax length, slip peak

2024-05-29
- Changed PS
- Changed tires slipcurve, combined grip, relax length, SAT
- Corrections

2024-05-22
- Changed rear stabilizer motion ratio

2024-05-17
- Changed stabilizers

2024-05-16
- Added elastokinematic toe compliance to Type-X
- Changed rear geometry
- Changed stabilizers
- Changed installation stiffness
- Simplified Drift rear subframe
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
- Changed Drift default rear alignment
- Changed Drift wheel offset

2024-02-29
- Changed bumpstops

2024-02-26
- Changed tire load curves

2024-02-25
- Minor tire changes

2024-02-18
- Changed tire load curves, combined grip, camber_spring_k

2024-02-06
- Initial version