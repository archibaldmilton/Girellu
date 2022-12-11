2022-12-07_4.1

- Big correction (?) to Normallage definition/design height
- Changed front suspension geometry
- Changed rear suspension geometry
- Changed alignment
- Changed OEM tire temperature luts
- Corrected curb weight
- Corrected broken aero sideforce in Sport Evolution and Drift
- Misc. changes

2022-11-23_4.0

- Changed tire temperature vs mu .luts
- Changed tire temperature vs level .luts (Routine change due to mu .lut change)
- Raised tire saturation peaks slightly
- Corrected wrong humidity reference for engine
- Improved autoblip parameters (Autoblip driving aid only)

2022-11-05_3.9

- Changed tire stiffness, slip, flex, pressure, load and heat parameters
- Changed installation stiffness
- Misc. changes

2022-08-19_3.8

- Changed tire camber curves
- Changed tire load curves

2022-06-25_3.7

- Changed alignment based on more accurate Normallage definition
- Changed dampers on M3, M3 Sport Evolution
- Changed stabilizers
- Changed rear spring range on Drift
- Changed front geometry for more accurate steering axis, bumpsteer
- Changed rear geometry to more accurate measurements
- Tire changes
- Misc. corrections

2022-06-07_3.6

- Changed tire slip parameters

2022-04-05_3.5

- Changed specification of Drift tire
- Changed default Drift rear tire pressure from 30 to 25
- Changed default final gear for Drift
- Raised maximum brake pressure in setup.ini to 120% for loadcell pedal users
- Changed automatic shifting parameters
- Cleaning of files

2022-03-27_3.4

- Added installation stiffness effect to corner springs
- Added chassis torsional stiffness effect to corner springs and stabilizers
- Changed default and adjustment range of Drift springs

06.03.2022 Version 3.3

- General changes
- Removed rear toe adjustment from stock cars
- Changed default setup for Drift
- Changed setup options for Drift
- Changed UI for Drift

15.01.2022 Version 3.2

- Changed front MR
- Changed spring range for Drift
- Changed default dampers for Drift
- Changed unsprung masses
- Tire changes
- Increased FFMULT
- Global updates

31.12.2021 Version 3.1

- Adjusted "bushing rates" to be a bit more reasonable
- Thanks to @baker7498 and @JPG_18 for advice
- Adjusted heating parameters of tires
- Adjusted vertical rates of tires
- Adjusted load curves of Drift tires

28.12.2021 Version 3.0

- Adjusted temperature vs mu curve of tires
- Adjusted heating parameters of tires
- Adjusted default pressures for tires to be more suitable for circuit use
- Lowered threshold for ABS operation

16.12.2021 Version 2.9

- Changed temperature vs mu curve of tires
- Changed temperature vs level curve of tires
- Changed temperature vs speed curve of tires
- Changed slipcurve of tires
- Lowered threshold for ABS operation
- Typo fixes in aero.ini

01.12.2021 Version 2.8

- Changed vertical and longitudinal aerodynamics
- Added side force to lateral aerodynamics
- Changed lateral aerodynamic side drag
- Misc. updating and standardizing

22.10.2021 Version 2.7

- Changed Drift UI description
- Global updates

29.09.2021 Version 2.6

- Changed optimal pressures of tires
- Added camber vs tire springrate .luts

25.09.2021 Version 2.5

- Changed characteristics of "passenger" tire heating
- Tire changes

12.08.2021 Version 2.4

- Standardized some things in syntax, minor tire changes

04.08.2021 Version 2.3

- Tire stiffness changes
- Added "passenger" heating
- Misc. changes

26.07.2021 Version 2.2

- Standardization and corrections to AI
- Standardization and corrections to autoshifter

15.07.2021 Version 2.1

- Updated tires
- Changed rear to more proper toe-arm placement
- Changed stabilizer specs
- Added some high-end torque to M3 E30 Drift engine
- Removed rear toe deflection emulation

06.04.2021 Version 2.0

- CSP version 0.1.68+ required, 0.1.73+ recommended
- Removed S-versions to ease development
- Removed DTM car; separate mod now
- Changed arch_bmw_m3_e30_evo3_1990_drift to arch_bmw_m3_e30_1986_drift
- New CSP Extended Physics heating for tires
- New CSP Extended Physics tire features for slip, self aligning torque, camber etc.
- New CSP Extended Physics suspension features
- New logic for tire load curves, combined grip
- New more accurate front strut geometry, requires CSP Strut FFB fix
- New more accurate rear semi-trailing arm suspension design
- Adjusted inertia (AC uses sprung input) thanks @JPG_18
- Adjusted CG based on better data
- Changed many stabilizer specs
- Corrected stroke distances, bumpstop thicknesses
- Corrected track widths and wheel offsets
- Modified engine torque curves, inertia
- Second throttle map for hopefully more natural accelerator feeling
- Adjusted CoG, colliders, UI and many other small fixes
- Changed yaw drag
- Added up to date CSP configs

08.07.2020 Version 1.9

- Removed 325i E30; if I update will probably be in a separate mod
- Removed 325is E30; if I update will probably be in a separate mod
- Redone rear suspension geometries
- Changed rear bumpstop
- Added brake proportioning valve effect via EBB, thanks to  @baker7498
- Differentiated DX and DY load curves in tires
- Tire changes
- Reverted trail changes; too subjective currently and likely more wrong than without
- Fixed typo in SV80 heating
- Changed massive BUMPSTOP_DN in DTM car; left in from testing

17.02.2020 Version 1.8

- Added M3 E30 AK01
- Added 325i E30
- Added 325is E30
- Redid both rear suspension layouts
- Changed Sport Evo dampers
- Changed M3 rear spring to "Late" type spring as per 1987 data
- Found more accurate damper travel ranges for E30, M3 from BMW manual
- More accurate motion ratios for sta-bars from BMW manual
- More accurate steering ratio for M3 from BMW manual
- More accurate E30, M3 front geometry
- Changed S14B25 rev limit from 7250 to 7800 as per new data; old seems to be B20
- Changed setups for tuned cars
- Removed crash bolts from Sport Evo
- Small suspension tweaks, corrections
- Corrected wheelbase, tracks in M3
- Tire tweaks to falloff, relax length that I forgot
- Changed masses to account for strut unsprung mass bug that I forgot
- Changed UIs

04.02.2020 Version 1.7

- Added Drift version
- Derived more accurate front sta-bar MR
- Adjusted wall thicknesses for sta-bars
- Moved trail axis of front suspension forward to combat issue with steering forces
- Figured out E36, Z3 etc. steering racks, refitted to S2 properly
- Minor tire changes
- Maybe minor suspension changes that I've forgot

04.12.2019 Version 1.6

- Implemented custom load curves to tires
- Tire tweaks
- Changed ARBs and ARB setup
- Changed M3 front knuckle geometry
- Changed rear toe deflection
- Changed brake bias
- New aero
- Added yaw drag fin
- Reverted S2 to stock M3 rack
- Bunch of small suspension changes, spring angle multiplier etc.
- Updated UIs

13.10.2019 Version 1.5

- Adjustment for damper oversight
- Calculated rollbars
- Changed rollbar setup design for tuned cars

27.09.2019 Version 1.4

- Reverted DTM rollbar links to "rubber" from "solid" due to new evidence
- Tire changes
- Changed throttle graph

26.07.2019 Version 1.3b

- Changed S2 steering rack from Z3 to E36; slower

22.07.2019 Version 1.3

- Lowered DTM tire rates by 20%
- Tweaked DTM tire grip falloff values which I forgot
- Different camber sensitivity values for tires
- Tweaked angular inertia for tires
- Changed unsprung masses to probably more accurate values
- Added camber adjustment to stock car via strut dome bolts
- Expanded S1 camber adjustment due to ^
- Made "poly bushing" lateral deflection effect stronger on S1 and S2

14.07.2019 Version 1.2

- Added S2 version
- Changed M3 E30 DTM 1992 damper bump characteristic
- Changed M3 E30 DTM 1992 suspension stroke characteristic
- Added nice description to DTM car
- Minor tweaks in inis and whatnot, mainly for modders

12.07.2019 Version 1.1b

- Changed M3 E30 DTM 1992 ARB range and adjustment based on new data
- Changed M3 E30 DTM 1992 damper range and adjustment based on new data
- Changed M3 E30 DTM 1992 rear camber and toe range and adjustment based on new data
- Changed M3 E30 DTM 1992 default setup to mix of Group A manual and common settings

11.07.2019 Version 1.1

- Added M3 E30 DTM 1992
- Changed undertray ground height sensitivity
- Adjusted graphics offset 1mm forward

09.07.2019 Version 1.0b

- Re-measured front suspension with more care
- More accurate track widths/offsets
- More accurate alignment
- Changed S1 alignment design from camber top to OEM parts

08.07.2019 Version 1.0

- Release!
- Added S1 version
- Added ST and SM tires
- Adjusted rear lift coef. from 0.7 to 0.8 (Compared to base model E30) based on new data
- Fixed big aero issue with front lip, oops! Thanks @baker7498
- Minor tweaks
- Added optional CSP features config, thanks @Leonardo Ratafiá

07.07.2019 Version 0.9e

- Completely new aerodynamics from the ground up
- Suspension tweaks

06.07.2019 Version 0.9d

- Added new engine(s): original curve courtesy of @mike12345678
- Tweaked tire very very slightly

05.07.2019 Version 0.9c

- Changed rear geometry slightly, rear bumpstops, front ARB, brakes, FFB among others

05.07.2019 Version 0.9b

- Changed bumpstops, height, rollbar, ARB, dampers, alignment, FFB among others

04.07.2019 Version 0.9

• Initial release

!!!IMPORTANT!!!

Requires shaders patch!

!!!IMPORTANT!!!

Includes:
BMW M3 E30
BMW M3 E30 Sport Evolution 2.5
BMW M3 E30 Drift

Credits:
Physics and custom UI file by Arch/Kyuubeey
UI file torque curves by x4fab's AC Torque Helper
Everything else by Kunos Simulazioni
Special thanks to: 
@baker7498, @mike12345678, @Leonardo Ratafiá among others
for data and help
@Matt for helping with Drift version
@kondor999 for testing and feedback


INSTALLATION INSTRUCTIONS:

The data.acd file is intended as a replacement used alongside the KS BMW M3 E30 visuals 
or a fitting visual of your choosing. Visuals and sound are not bundled with the package.
How to install:

RECOMMENDED VISUALS AND SOUND

M3 = KS M3 E30 and KS M3 E30 sound
Sport Evo = KS M3 E30 and KS M3 E30 sound
Drift = KS M3 E30 D and KS M3 E30 D

Installation instructions

1.
make 3 new folders on content\cars:
arch_bmw_m3_e30_1986
arch_bmw_m3_e30_evo3_1990
arch_bmw_m3_e30_1986_drift

2.
copy from folder bmw_m3_e30
all these files to the new previously created folders:
arch_bmw_m3_e30_1986
arch_bmw_m3_e30_evo3_1990

3.
copy from folder bmw_m3_e30_drift
all these files to the new previously created folders:
arch_bmw_m3_e30_1986_drift

4.
IMAGE_1.png
Extract and replace all from the downloaded file

5.
IMAGE_2.png
Use CM to Replace Sound (Bottom Right Icon)

OPTIONAL CSP FEATURES

1.
Extract folder "extension" to Assetto Corsa directory


