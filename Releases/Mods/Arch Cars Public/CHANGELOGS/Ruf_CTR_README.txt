!!!IMPORTANT!!!

Shaders patch 0.2.8+ required!

!!!IMPORTANT!!!

Includes:
RUF CTR

Credits:
Physics by Arch
Everything else by Kunos Simulazioni

Thanks to @mike12345678 and @AlleyViper for data

CHANGELOG

2025-08-15_A
- Corrected bushing preload

2025-08-11_A
- Fixed header typo in car.ini

2025-07-29_A
- Changed tires thermals, slip

2025-07-14_A
- Reverted tires FRICTION_K, SURFACE_ROLLING_K

2025-07-11_A
- Changed tires PRACTICAL_TEMP_RATIO, thermals, slip

2025-07-04_A
- Changed autoshifting, gearbox parameters

2025-06-21_A
- Changed tires rolling resistance, SAT

2025-06-12_A
- Changed tires load, slip, pressure

2025-05-25_A
- Changed COMBINED_FACTOR

2025-05-24_A
- Changed brake heat
- Corrected "bushings" to act as pull springs

2025-05-17_A
- Changed tires load curve

2025-05-16_A
- Changed aero

2025-05-14_A
- Changed tires CX_MULT

2025-05-05_A
- Changed load curve mu
- Changed brake booster curve

2025-05-03_A
- Changed tires combined grip
- Changed ABS slip goal, frequency

2025-05-01_A
- Changed tires LEVEL, YMULT
- Changed handbrake

2025-04-28_A
- Changed tires

2025-04-07_A
- Updated engines for better idle handling
- Updated script.lua to fix? idle/coast? bug again

2025-04-06_A
- Changed bushings

2025-03-29_A
- Changed script.lua to fix autoblip issue

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

2025-01-14_A
- Changed tires

2024-12-30_A
- Added 10m/s point to damper luts
- Removed chassis torsion flex
- Changed tire slip, load, camber, SAT

2024-10-15_A
- Changed brakes

2024-09-20
- Changed reference brake foot force from 100kgf to 50kgf, setup max to 200%
- Changed tires heat, slip, load, wear etc.

2024-08-15
- Added steering U-joint nonlinearity (thanks @jpg_18, mod-talk)
- Changed tire thermals

2024-08-09
- Reverted from force to slip relax length
- Changed tire SAT, FALLOFF_SPEED, FALLOFF_YSPEED_MULT, FLEX_GAIN, heat_mu

2024-07-31
- Added (back) brake booster
- Changed brake temp curve
- Changed tire load sensitivity
- Changed front damper droop travel
- Changed default alignment
- Changed engine torque curve, boost peak, idle RPM
- Changed dev comments
- Changed UI

2024-07-21
- Changed tires load, slip, heat, angular inertia
- Changed damper travel, stiffness
- Changed bumprubber length, stiffness
- Changed aero
- Changed default brake bias
- Changed 3D offsets

2024-07-13
- Removed brake booster
- Changed brake mu curve
- Changed brake proportioning valve

2024-07-12
- Changed PRELOAD to PRELOAD_TORQUE due to bug
- Changed front tbar axis orientation (setup screen preload signage)
- Changed front droop travel
- Changed setup.ini syntax

2024-07-10
- Changed tires camber curve
- Changed suspensions.ini syntax

2024-05-31
- Changed tires X_MULT, LEVEL, SPEED, FALLOFF_YSPEED_MULT

2024-05-29
- Changed tires slipcurve, combined grip, relax length, SAT

2024-05-05
- Changed aero
- Changed differential
- Changed unsprung masses
- Changed colliders
- Changed default rear tire pressure

2024-05-01
- Changed dampers
- Changed default brake bias and setup range
- Corrected large error in front coilover length (oops)
- Corrections

2024-04-29
- Changed front geometry
- Changed front stabilizer

2024-03-22
- Changed tire damping
- Changed brakes, brake heating

2024-03-17
- Added corner torsion bar preload adjustment
- Changed corner torsion bar PRELOAD_TORQUE to PRELOAD
- Changed rear geometry, alignment
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

2024-01-18
- Changed tire slip, load parameters

2023-12-24
- Changed method of front toe adjustment from translation to length
- Changed syntax of setup options
- Changed tire thermal model to 1 (Less buggy)
- Minor tire changes

2023-11-12
- First COSMIC version, CSP 1.80+ compatibility only!
- Added object-based alignment, springs, dampers etc.
- Added chassis torsion flex
- Added multiple loadpoint tire model
- Changed tire heat
- Changed brake heat
- Changed suspension
- Changed load, slip, combined grip, SAT, wear
- Changed tire thermal model version, temperature load biasing
- Changed FFMULT
- Changed 3D offset
- Changed suspensions.ini syntax from POS0 to POS_A etc.

2023-06-26_3.7

- Changed combined grip
- Changed UI

2023-06-17_3.6

- Added brake heat
- Calibrated 100% brake torque to 50kg pedal force
- Changed slip and SAT
- Changed load vs mu .luts
- Changed THERMAL_MODEL 1 to 2
- Changed BRAKE_TO_CORE 0.00006 to 0.003
- Changed CARCASS_ROLLING_K 0.21 to 0.25
- Changed FFMULT
- Changed tyres.ini indexing
- Changed brake bias setup range
- Added hints to load curve luts

2023-03-05_3.5

- Changed temperature vs slip .luts (large change when drifting)
- Changed load vs mu .luts

2022-12-29_3.4

- Changed tires
- Changed suspension
- Improved autoblip parameters (Autoblip driving aid only)
- Corrected wrong humidity reference for engine

2022-06-07_3.3

- Changed tire slip parameters
- Changed automatic shifting parameters
- Minor cleaning of files

2022-03-27_3.2

- Added installation stiffness effect to corner springs
- Added chassis torsional stiffness effect to corner springs and stabilizers

06.03.2022 Version 3.1

- General changes

15.01.2022 Version 3.0

- Tire changes
- Adjusted unsprung mass
- Global updates

31.12.2021 Version 2.9

- Adjusted heating parameters of tires
- Adjusted vertical rates of tires
- Adjusted load curves of tires

28.12.2021 Version 2.8

- Adjusted temperature vs mu curve of tires
- Adjusted heating parameters of tires
- Adjusted default pressures for tires to be more suitable for circuit use

16.12.2021 Version 2.7

- Changed temperature vs mu curve of tires
- Changed temperature vs level curve of tires
- Changed temperature vs speed curve of tires
- Changed slipcurve of tires
- Changed vertical and longitudinal aerodynamics

01.12.2021 Version 2.6

- Reduced moment of inertia
- Added side force to lateral aerodynamics
- Changed lateral aerodynamic side drag

22.10.2021 Version 2.5

- Global updates

29.09.2021 Version 2.4

- Changed default and optimal pressures of tires
- Added camber vs tire springrate .luts

25.09.2021 Version 2.3

- Changed characteristics of "passenger" tire heating
- Changed tire heating from "sport" to "passenger"
- Tire changes

12.08.2021 Version 2.2

- Added 6-speed transmission option
- Corrected tire from Pirelli Cinturato P7 to Dunlop Denloc SP Sport D40
- Corrected front stabilizer to 23.0 OD Ruf
- Corrected trailing arm to 911 type
- Corrected "bushings" to hard type
- Corrected (?) wheel offset, track width specs
- Corrected (?) physics suspension height
- Redid aero and corrected oversights
- Minor correction (?) to gear ratios for 5-speed gearbox
- Made front geometry more accurate from references
- Made rear geometry more accurate from homologation document data
- Changed front torsion bar dimension, rate
- Changed rear torsion bar swing arm length
- Changed damping specs from Bilstein Sport damper specs
- Changed front stabilizer MR
- Changed rear stabilizer dimension, MR
- More accurate stroke ranges, bumpstops
- More accurate LSD specs, added Cphys .luts
- More accurate (?) alignment ranges
- Minor improvements

04.08.2021 Version 2.1

- Tire stiffness changes
- Added "passenger" heating
- Misc. changes

26.07.2021 Version 2.0

- Standardization and corrections to AI
- Standardization and corrections to autoshifter

15.07.2021 Version 1.9

- Added Extended Physics features
- Updated tires
- Updated aero
- New proper rear semi-trailing arm geometry
- Changed stabilizer specs
- Corrected diff preload, added options in OE spec range
- Removed rear toe deflection emulation
- Some small accuracy corrections
- Added up to date ext_config

04.02.2020 Version 1.8

- Added load curves to tires
- Minor tire changes
- Changed Street90s to Street80s and adjusted; more period accurate
- Suspension changes
- Updated trailing arm toe deflection to new method
- Aero changes
- Added fins for yaw drag
- Changed inertia

13.10.2019 Version 1.7

- Adjustment for damper oversight
- Calculated rollbars

27.09.2019 Version 1.6

- Changed front geometry
- Small adjustment to trailing arm sweep angle
- Changed inertia
- Tire changes
- Default brake bias to full rear
- Moved fuel tank: was incorrect

11.09.2019 Version 1.51

- Corrected issue in front SM width. I left in 185mm testing value: sorry!

11.09.2019 Version 1.5

- Changed front geometry
- Changed height
- Changed strokes
- Changed damping
- Reverted back to lower ARB rates; links described as "stock"
- Corrected rear track

09.09.2019 Version 1.4

- Changed inertia
- Changed rear spoiler dimensions, position, yaw sensitivity
- Increased ARB coefficient to account for stiffer links
- Corrected car mass for bug/feature? in STRUT
- Corrected CoG for sprung mass calculation

07.09.2019 Version 1.3

- Changed front geometry
- Corrected spacers, offsets, track widths etc.
- Thanks to @mike12345678 and @AlleyViper for data

06.09.2019 Version 1.2

- Changed front geometry
- Changed suspension stroke and bumpstops
- Tire changes
- Adjusted SM default pressure closer to ideal for track driving
- Inertia changes
- Collider changes
- Misc. changes

05.07.2019 Version 1.1b

- Added "flexible rear bushing" that I forgot

08.06.2019 Version 1.1

- Redid front and rear suspension using Porsche factory curves and images
- Changed alignment setup for toe
- Changed default alignment to 930 standard
- Corrected default LSD lock
- Added in full range of LSD lock
- Standardized some tire values, heating
- Adjusted brakes and bias adjustment

05.06.2019 Version 1.0b

- Corrected small oversight in suspension
- Added car directory folder

04.06.2019 Version 1.0

� Initial release