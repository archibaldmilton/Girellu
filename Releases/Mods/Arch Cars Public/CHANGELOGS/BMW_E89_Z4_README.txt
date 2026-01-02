!!!IMPORTANT!!!

Shaders patch 0.2.8+ required!

!!!IMPORTANT!!!

Includes:
E89 Z4 sDrive35i

Credits:
Physics by Arch
Everything else by Kunos Simulazioni

CHANGELOG

2026-01-02_A
- Changed ABS
- Changed TC

2025-12-27_A
- Removed chassis pitch flex (vibrates)
- Added weak handbrake for parking
- Changed ABS
- Changed tires PATCH_TRANSFER

2025-12-13_A
- Corrected chassis flex damper positions

2025-12-05_B
- Changed tire load curves

2025-12-05_A
- Added chassis torsion and pitch stiffness
- Changed brake thermals
- Changed tire thermals

2025-11-30_A
- Changed brake thermals
- Changed tire thermals

2025-11-25_A
- Changed tire load curves

2025-11-24_A
- Changed tire thermals
- Changed brake thermals

2025-11-17_A
- Changed brake thermals

2025-11-16_A
- Changed tire rolling radius speed and load sensitivity
- Changed ABS
- Changed rear toe setup
- Corrected ride height

2025-11-07_A
- Changed tire slip, camber, load sensitivity
- Changed PS
- Removed ABS slip_diff_lat, slip_diff_axle controllers for now

2025-10-12_A
- Corrected RE050A RFT tire temperature luts files
- Changed RE050A RFT tire rear camber curve

2025-07-29_A
- Changed tires thermals, slip

2025-07-14_A
- Reverted tires FRICTION_K, SURFACE_ROLLING_K

2025-07-11_A
- Changed tires PRACTICAL_TEMP_RATIO, thermals, slip

2025-07-04_A
- Changed autoshifting, gearbox parameters

2025-06-29_A
- Changed RE050A load curves
- Changed clutch torque

2025-06-21_A
- Changed tires rolling resistance, SAT

2025-06-17_A
- Changed EBB

2025-06-12_A
- Changed tires load, slip, pressure

2025-06-07_B
- Changed RE050A RFT load curves
- Removed ABS long sensor

2025-06-07_A
- Changed RE050A RFT load curves

2025-06-04_A
- Added ABS uneven friction logic

2025-05-25_A
- Changed COMBINED_FACTOR
- Changed TC

2025-05-24_A
- Changed brake heat
- Corrected "bushings" to act as pull springs

2025-05-17_A
- Changed tires load curve

2025-05-16_A
- Changed ABS
- Changed aero

2025-05-14_A
- Added engine flow on cut
- Added Cphys ABS (CSP 0.2.8+ required!)
- Changed tires CX_MULT

2025-05-05_A
- Changed load curve mu
- Changed brake booster curve

2025-05-03_A
- Changed tires combined grip
- Changed ABS slip goal, frequency

2025-05-01_A
- Changed tires LEVEL, YMULT

2025-04-26_A
- Changed tires
- Changed ARB
- Changed PS
- Changed rear geometry

2025-04-07_A
- Updated engines for better idle handling
- Updated script.lua to fix? idle/coast? bug again

2025-04-06_A
- Changed bushings

2025-03-29_A
- Changed script.lua to fix autoblip issue

2025-03-08_A
- Changed brakes
- Changed ABS slipratio goal

2025-03-03_A
- Added LUA throttle, idle, coast model by @switchpro, @ustahl, @jpg_18
- Corrected brake pressure
- Fixed rear camber adjust body reference
- Changed tire load curves
- Changed CGH

2025-02-09_A
- Added bushing vertical damping
- Changed bushing vertical rates
- Changed stabilizer installation stiffness

2025-01-14_A
- Changed rear brake disc effective radius
- Changed tires

2024-12-30_A
- Added 10m/s point to damper luts
- Removed chassis torsion flex
- Changed tire slip, load, camber, SAT
- Changed corner spring installation stiffness

2024-10-15_A
- Changed brakes

2024-09-20
- Changed reference brake foot force from 100kgf to 50kgf, setup max to 200%
- Changed tires heat, slip, load, wear etc.
- Changed "OEM" brake friction curve
- Changed stabilizers
- Changed ABS, EBB, TC

2024-08-15
- Added steering U-joint nonlinearity (thanks @jpg_18, mod-talk)
- Changed tire thermals
- Changed tire load curve

2024-08-09
- Reverted from force to slip relax length
- Changed tire SAT, FALLOFF_SPEED, FALLOFF_YSPEED_MULT, FLEX_GAIN, heat_mu
- Changed PS

2024-07-21
- Changed tires slip, heat

2024-07-10
- Changed tires camber curve

2024-05-31
- Changed PS
- Changed tires X_MULT, LEVEL, SPEED, FALLOFF_YSPEED_MULT

2024-05-29
- Changed PS
- Changed tires slipcurve, combined grip, relax length, SAT
- Changed suspensions.ini syntax

2024-05-13
- Added elastokinematic rear toe compliance
- Changed rear geometry, toe adjustment method
- Changed stiffness of bushing vertical rate
- Changed installation stiffness
- Corrections

2024-03-24
- Added rear camber adjustability
- Increased differential lock to emulate Elektronisches Sperrdifferential
	- brakesteer not currently working with extended brakes, maybe lua implementation later?
- Changed BASEY
- Changed PS
- Changed syntax in suspensions.ini

2024-03-22
- Changed tire damping

2024-03-17
- Changed tire damping
- Changed tire rolling resistance

2024-03-10
- Changed tire damping

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

2024-02-23
- Changed tire load curves, combined grip, camber_spring_k

2024-02-01
- Added brake mu .lut that I forgot to add (oops)

2024-01-29
- Added wider brake torque range in setup.ini that I forgot to add

2024-01-27
- Added extended brakes system, realfeel
- Added booster servo saturation to torque calculation
- Calibrated brakes to 100kgf pedal
- Changed tire and brake thermals

2024-01-18
- Changed tire slip, load parameters

2023-12-27
- Initial release