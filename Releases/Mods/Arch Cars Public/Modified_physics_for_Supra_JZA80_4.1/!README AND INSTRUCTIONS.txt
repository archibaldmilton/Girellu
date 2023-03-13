2023-03-06_4.1

- Corrected error in RZ rear bumpstop .lut
- Shortened suspensions.ini
- File cleaning

2023-02-15_4.0
- Changed temperature vs slip .luts (large change when drifting)
- Changed load vs mu .luts

2022-12-19_3.9

- Adjusted normal suspension alignment height
- Adjusted alignment and alignment ranges

2022-11-23_3.8

- Changed tire temperature vs mu .luts
- Changed tire temperature vs level .luts (Routine change due to mu .lut change)
- Raised tire saturation peaks slightly
- Added bumpstop .luts
- Added install_k to bumpstops
- Corrected wrong humidity reference for engine
- Improved autoblip parameters (Autoblip driving aid only)

2022-11-05_3.7

- Changed tire stiffness, slip, flex, pressure, load and heat parameters
- Changed installation stiffness
- Changed Drift front spring range and default
- Misc. changes

2022-08-19_3.6

- Changed RZ tire from RE010 to RE020
- Changed standard engines
- Changed Drift dampers, implemented damper .luts
- Change to RZ damper .luts
- Change to damper strokes
- Change to stabilizer installation stiffness
- Tire changes
- AI changes
- Filename changes

2022-06-07_3.5

- Changed tire slip parameters
- Minor engine adjustments
- Minor cleaning of files
- Adjusted readme and extconfig

2022-04-05_3.4

- Changed specification of Drift tire
- Raised maximum brake pressure in setup.ini to 120% for loadcell pedal users
- Changed automatic shifting parameters
- Cleaning of files

2022-03-27_3.3

- Added installation stiffness effect to corner springs
- Added chassis torsional stiffness effect to corner springs and stabilizers
- Changed default and adjustment range of Drift springs
- Corrections (?) to bumpstops/packers
- Corrected TBR for Torsen based on better data
- Changed ABS actuation threshold
- Changed EBD ratio curve
- Adjusted collider.ini
- Minor cleaning up of files

06.03.2022 Version 3.2

- General changes
- Added more LSD options to Drift
- Changed default setup for Drift
- Changed setup options for Drift

15.01.2022 Version 3.1

- Tire changes
- Global updates

31.12.2021 Version 3.0

- Adjusted "bushing rates" to be a bit more reasonable
- Thanks to @baker7498 and @JPG_18 for advice
- Adjusted heating parameters of tires
- Adjusted vertical rates of tires
- Adjusted load curves of tires

28.12.2021 Version 2.9

- Adjusted temperature vs mu curve of tires
- Adjusted heating parameters of tires
- Adjusted default pressures for tires to be more suitable for circuit use
- Lowered threshold for ABS operation

16.12.2021 Version 2.8

- Changed temperature vs mu curve of tires
- Changed temperature vs level curve of tires
- Changed temperature vs speed curve of tires
- Changed slipcurve of tires
- Changed vertical and longitudinal aerodynamics
- Lowered threshold for ABS operation
- Fixed oversight in setup.ini for Drift

01.12.2021 Version 2.7

- Added more controllers to EBD, changed .lut behavior
- Added side force to lateral aerodynamics
- Changed lateral aerodynamic side drag
- Misc. updating and standardizing
- Lowered FFMULT
- Corrected outdated and wrong information in readme

24.10.2021 Version 2.6

- Changed EBD .lut
- Corrected faulty ctrl_ebb.ini

22.10.2021 Version 2.5

- Changed EBD .lut
- Global updates

29.09.2021 Version 2.4

- Changed default and optimal pressures of tires
- Added camber vs tire springrate .luts

25.09.2021 Version 2.3

- Changed characteristics of "passenger" tire heating
- Changed RZ tire heating from "sport" to "passenger"
- Tire changes

08.09.2021 Version 2.2

- Implemented CSP damper luts to RZ for slightly more accurate curves
- Tire changes

12.08.2021 Version 2.1

- Standardized some things in syntax, minor tire changes

04.08.2021 Version 2.0

- Added better TRAC implementation
- Tweaked DBW graphs
- Changed torque bias ratio assumption for LSD
- Tire stiffness changes
- Misc. changes

26.07.2021 Version 1.9

- Standardization and corrections to AI
- Standardization and corrections to autoshifter

20.07.2021 Version 1.8

- Better ML -> DWB rear geometry implementation for closer curves (Mainly antisquat and roll center)

31.05.2020 Version 1.7 Get it while you can

- Removed S-versions
- Added JZA80 Drift
- New CSP Extended Physics heating for tires
- New CSP Extended Physics tire features for slip, self aligning torque, camber etc.
- New CSP Extended Physics suspension features
- New logic for tire load curves, combined grip
- Corrected some errors in suspension geometries
- More accurate alignment ranges from manual
- More accurate unsprung mass from EPC
- Changed damper rates based on BM damper dyno
- Changed spring rates based on BM data
- Changes to engines
- Changed some setup options, alignment
- Changed CG
- Changed inertia
- Changed stroke ranges
- Second throttle map for hopefully more natural accelerator feeling
- Tire changes
- Changed yaw drag
- Minor aero changes
- Reverted some jank from earlier patches
- Added up to date CSP configs

01.06.2020 Version 1.65

- Moved front suspension trail axis forward, alleviates some bad FFB from physics discrepancy
- Tidied up some files a bit

08.05.2020 Version 1.6

- Added load curves to tires
- Tire changes
- Recalculated aero
- Added aero yaw drag fin
- Recalculated rollbars based on more detailed thickness data
- Added bushing vertical stiffness
- Re-aligned cars
- Corrected EBD
- Minor suspension corrections

13.10.2019 Version 1.5

- Adjustment for damper oversight
- Lowered S2 rear default ARB

27.09.2019 Version 1.4b

- Added aero.ini back in to S1 and S2. Don't know what happened there.
- Removed likely incorrect preload from stock diff; T-2 not T-2R

27.09.2019 Version 1.4

- New ARBs from measurements, thanks @Kaiser#4463
- Default SM tire pressure to 24, closer to ideal
- Tire changes
- Accounted CoG for sprung mass calc
- Changed throttle graph

29.08.2019 Version 1.3

- Changed turbo operation to be closer to VVTi engine
- Changed ARBs a bit closer: still waiting for more solid data
- Changed diff from "Torsen I" to "Torsen II" with preload
- Changed brakes, EBD based on new data
- Changed front damper stroke 10mm shorter
- Increased drag based on new data
- Lowered coast torque
- FFB modifier 2.1 -> 1.8
- Raised Time Attack version 10mm, for a bit more drivabilty on most tracks
- Updated Time Attack version damper stroke which I forgot
- Time Attack version default boost to 100%
- Adjusted wheel offsets and 3D offset

18.08.2019 Version 1.2

- Added Time Attack version
- Corrected S2 rear ARBs; max stiffer

12.08.2019 Version 1.1

- Added S2 version
- Corrected faulty high end power
- Corrected faulty aero ratios: balance is still same
- Changed stock damping based on new data
- Changed S1 turbo design slightly
- Changed wheel graphics offsets to better represent visuals


11.08.2019 Version 1.0

- Release!

!!!IMPORTANT!!!

SHADERS PATCH REQUIRED! Requires JDM Pack DLC by Kunos!

!!!IMPORTANT!!!

Includes:
Supra JZA80 RZ
Supra JZA80 Drift

Credits:
Original laserscanned suspension by Aad Hofman
Physics by Arch
Everything else by Kunos Simulazioni

Special thanks:
baker7498 for providing lots of data and literature

INSTALLATION INSTRUCTIONS:

The data.acd file is intended as a replacement used alongside the KS Supra MKIV visuals
or a fitting visual of your choosing. Visuals and sound are not bundled with the package.

How to install:

RECOMMENDED VISUALS AND SOUND

Supra JZA80 RZ: KS Supra MKIV 3D and KS Supra MKIV sound
Supra JZA80 Drift: KS Supra Drift 3D and KS Supra Drift sound

Installation instructions

1.
Make 2 new folders on content\cars:
arch_toyota_supra_a80_1997_rz
arch_toyota_supra_a80_1997_drift

2.
Copy from folder ks_toyota_supra_mkiv
all these files to the new previously created folders:
arch_toyota_supra_a80_1997_rz

3.
Copy from folder ks_toyota_supra_mkiv_drift
all these files to the new previously created folders:
arch_toyota_supra_a80_1997_drift

4. 
Extract and replace all from the downloaded file

5. 
Use CM to Replace Sound


