!!!IMPORTANT!!!

Shaders patch 0.2.8+ required! Requires JDM Pack DLC by Kunos!

!!!IMPORTANT!!!

Includes:
BNR34 V-spec

Credits:
Physics by Arch
Everything else by Kunos Simulazioni

Special thanks:
Ma7heus for creating the original 3D model back when the car was a mod
MisterCognac for suspension measurement, data, advice and testing (R33)
AshNismo for suspension measurement, data, advise and testing (R32)
Kade for assisting in figuring out the electronic systems
Venitros for driving opponent cars during testing
baker7498, stereo, mclarenf1papa and Leonardo Ratafiá and many others for help

CHANGELOG

2025-12-05_A
- Added chassis torsion and pitch stiffness
- Changed brake thermals
- Changed tire thermals

2025-11-30_A
- Changed brake thermals
- Changed tire thermals

2025-11-24_A
- Changed tire thermals
- Changed brake thermals

2025-11-16_A
- Changed tire rolling radius speed and load sensitivity
- Changed brake thermals
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
- Corrected RE040 mass

2025-07-06_A
- Added Xg sensor to ATTESA
- Changed V-spec rear LSD power lock

2025-07-04_A
- Changed autoshifting, gearbox parameters

2025-06-29_A
- Changed RE040 load curves
- Changed clutch torque

2025-06-25_A
- Changed ATTESA

2025-06-21_A
- Changed tires rolling resistance, SAT

2025-06-17_A
- Corrected bushing preload
- Corrected ATTESA ramp

2025-06-12_A
- Changed tires load, slip, pressure

2025-06-04_A
- Added ABS uneven friction logic

2025-06-02_A
- Changed front bushing vertical rate

2025-05-25_A
- Changed COMBINED_FACTOR

2025-05-24_A
- Changed brake heat
- Changed unsprung masses
- Corrected rear brake rotor mass
- Corrected "bushings" to act as pull springs

2025-05-18_A
- Corrected wheel offset back to standard value, previous left from testing

2025-05-17_A
- Changed tires load curve
- Changed ATTESA
- Changed HICAS
- Changed engine
- Changed rear LSD

2025-05-16_A
- Changed engine
- Changed rear LSD
- Changed ATTESA deadband
- Changed ABS
- Changed aero
- Removed HICAS low speed steer out condition

2025-05-14_B
- Changed stabilizers

2025-05-14_A
- Added Cphys ABS (CSP 0.2.8+ required!)
- Changed ATTESA, HICAS lateral acceleration maps
- Changed rear coilover outboard position
- Changed tires CX_MULT

2025-05-05_A
- Changed load curve mu
- Changed brake booster curve

2025-05-03_A
- Changed tires combined grip
- Changed ABS slip goal, frequency

2025-05-01_A
- Changed tires LEVEL, YMULT
- Changed PS
- Changed handbrake

2025-04-27_A
- Changed tires
- Changed installation stiffness
- Changed rear bushing vertical stiffness

2025-04-07_A
- Updated engines for better idle handling
- Updated script.lua to fix? idle/coast? bug again

2025-04-06_A
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

2025-02-11_A
- Added bushing vertical damping
- Changed bushing vertical rates
- Changed stabilizer installation stiffness
- Changed rear elastokinematics stiffness
- Changed dampers
- Changed ABS slipratio goal

2025-01-28_A
- Changed PS

2025-01-14_A
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
- Changed ABS
- Changed stabilizers

2024-08-15
- Added steering U-joint nonlinearity (thanks @jpg_18, mod-talk)
- Changed tire thermals

2024-08-11
- Actually included car in update this time

2024-08-09
- Reverted from force to slip relax length
- Changed tire SAT, FALLOFF_SPEED, FALLOFF_YSPEED_MULT, FLEX_GAIN, heat_mu
- Changed PS

2024-07-21
- Changed tires slip, heat

2024-07-10
- Changed tires camber curve

2024-06-08
- Corrections

2024-05-31
- Changed tires X_MULT, LEVEL, SPEED, FALLOFF_YSPEED_MULT

2024-05-29
- Removed front elastokinematic toe compliance
- Changed PS
- Changed tires slipcurve, combined grip, relax length, SAT

2024-05-22
- Changed rear stabilizer motion ratio

2024-05-17
- Changed stabilizers

2024-05-16
- Added elastokinematic toe compliance
- Changed rear geometry
- Changed stabilizers
- Changed suspensions, ctrl_4ws, ctrl_awd2 syntax
- Changed rear 3D offsets

2024-04-05
- Changed front geometry
- Changed PS

2024-03-22
- Changed tire damping

2024-03-17
- Changed tire damping

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
- Changed tire load curves, combined grip, camber_spring_k

2024-01-27
- Added extended brakes system, realfeel
- Added booster servo saturation to torque calculation
- Calibrated brakes to 100kgf pedal
- Changed tire and brake thermals
- Changed engine
- Added optional N1, NISMO engines in data folder
- Minor tyres.ini changes

2024-01-20
- Changed car mass
- Changed tire load curves
- Changed front stabilizer motion ratio
- Changed rear bushing vertical rate
- Minor change to front steering arm
- Changed 3D offset

2024-01-18
- Changed tire slip, load parameters
- Changed front suspension geometry
- Changed stabilizer rates
- Changed spring, stabilizer install rates
- Changed suspension height
- Changed damper travel range
- Changed setup rideheight readout
- Changed HICAS operation logic, control maps, syntax
- Changed ATTESA roadspeed control map, syntax
- Changed ABS slipratio goal
- Changed aero slightly
- Changed 3D offset
- Corrected (?) steering turns lock to lock (PR26AF vs PR26SE)
- Minor correction to brakes
- Minor changes to suspensions.ini

2023-12-27
- Changed bumpstops

2023-12-24
- Changed tire thermal model to 1 (Less buggy)

2023-12-18
- Changed front geometry
- Changed suspension damping
- Changed rear differential lock
- Changed ABS
- Disabled ers and steer_brake_controller (conflict with brakes system)

2023-11-23
- Changed PS curve
- Changed tire SAT

2023-11-12
- First COSMIC version, CSP 1.80+ compatibility only!
- Added object-based alignment, springs, dampers etc.
- Added chassis torsion flex
- Added multiple loadpoint tire model
- Changed tire heat
- Changed brake heat
- Changed load, slip, combined grip, SAT, wear
- Changed tire thermal model version, temperature load biasing
- Changed steering ratio
- Changed suspensions.ini syntax from POS0 to POS_A etc.