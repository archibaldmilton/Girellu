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

• Initial release

!!!IMPORTANT!!!

Shaders patch 0.20+ required!

!!!IMPORTANT!!!

Includes:
RUF CTR Yellowbird

Credits:
Physics and custom UI file by Arch/Kyuubeey
UI file torque curves by x4fab's AC Torque Helper
Everything else by Kunos Simulazioni
Thanks to @mike12345678 and @AlleyViper for data

RECOMMENDED VISUALS AND SOUND

CTR = KS Yellowbird



