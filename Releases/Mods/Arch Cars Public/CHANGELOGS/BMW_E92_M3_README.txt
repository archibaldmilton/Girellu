!!!IMPORTANT!!!

Shaders patch 0.2.3+ required!

!!!IMPORTANT!!!

Includes:
E92 M3

Credits:
Physics by Arch
Everything else by Kunos Simulazioni

Special thanks to: 
@baker7498

RECOMMENDED VISUALS AND SOUND

E92 M3 = KS M3 E92

CHANGELOG

2025-05-05_A
- Changed brake booster curve

2025-05-03_A
- Changed tires combined grip
- Changed ABS slip goal, frequency

2025-05-01_A
- Added rear toe elastokinematics
- Changed tires LEVEL, YMULT
- Changed handbrake
- Minor rear fixes

2025-04-26_A
- Changed tires

2025-04-07_A
- Updated engines for better idle handling
- Updated script.lua to fix? idle/coast? bug again

2025-04-06_A
- Changed bushings

2025-03-29_A
- Changed script.lua to fix autoblip issue

2025-03-18_A
- Changed brake booster

2025-03-08_A
- Changed brakes
- Changed ABS slipratio goal

2025-03-03_A
- Added LUA throttle, idle, coast model by @switchpro, @ustahl, @jpg_18
- Corrected brake pressure
- Changed tire load curves
- Changed handbrake torque

2025-02-09_A
- Added bushing vertical damping
- Changed bushing vertical rates
- Changed stabilizer installation stiffness
- Changed ABS slipratio goal

2025-01-14_A
- Changed brake booster
- Changed tires

2024-12-30_A
- Added 10m/s point to damper luts
- Removed chassis torsion flex
- Changed tire slip, load, camber, SAT
- Changed corner spring installation stiffness

2024-10-21_A
- Removed (completely ineffective and redundant) rear toe elastokinematics
	- Investigating alternatives, but probably none usable, vibrates excessively

2024-10-15_A
- Changed brakes

2024-09-20
- Changed reference brake foot force from 100kgf to 50kgf, setup max to 200%
- Changed tires heat, slip, load, wear etc.
- Changed ABS, EBD, TC

2024-08-15
- Added steering U-joint nonlinearity (thanks @jpg_18, mod-talk)
- Changed tire thermals
- Changed tire load curve

2024-08-09
- Reverted from force to slip relax length
- Changed tire SAT, FALLOFF_SPEED, FALLOFF_YSPEED_MULT, FLEX_GAIN, heat_mu
- Changed PS

2024-07-31
- Fixed rear camber alignment not functioning

2024-07-21
- Changed tires slip, heat

2024-07-10
- Changed tires camber curve

2024-06-08
- Corrected front bumpstop rate hint

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
- Changed unsprung masses
- Corrections

2024-03-24
- Corrected camber_spring_mult reference in tyres.ini
	- Fixed tires popping when using data.acd

2024-03-22
- Added missing brake mu curve (I dunno)
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
- Changed brake mu curve

2024-01-29
- Added wider brake torque range in setup.ini that I forgot to add

2024-01-27
- Added extended brakes system, realfeel
- Added booster servo saturation to torque calculation
- Calibrated brakes to 100kgf pedal
- Changed tire and brake thermals

2024-01-18
- Changed tire slip, load parameters

2023-12-31
- Changed maximum engine RPM as per BMW documentation
- Minor modification to engine torque curve
- Minor modification to analog instruments RPM gauge
- Minor syntax improvement to suspensions.ini

2023-12-27
- Changed unsprung masses

2023-12-24
- Changed brake pedal force from 50kgf to 70kgf
- Changed rear tire load curves
- Changed stabilizers
- Changed bumpstops, damper stroke
- Changed steering ratio, degrees to account for lack of progressive rack

2023-12-20
- Corrected (?) mass, wheelbase, track
- Corrected CHASSIS_REAR
- Minor changes

2023-12-19
- Initial release