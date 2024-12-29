!!!IMPORTANT!!!

Shaders patch 0.2.3+ required! Requires JDM Pack DLC by Kunos!

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
Kade for assisting in figuring out the electrical systems
Venitros for driving opponent cars during testing
baker7498, stereo, mclarenf1papa and Leonardo Ratafiá and many others for help

RECOMMENDED VISUALS AND SOUND

BNR34 V-spec = KS Skyline R34

CHANGELOG

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


