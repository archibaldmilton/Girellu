2023-02-15_5.1
- Changed temperature vs slip .luts (large change when drifting)
- Changed load vs mu .luts

2022-12-19_5.0

- Adjusted suspension geometry
- Adjusted normal suspension alignment height
- Adjusted alignment and alignment ranges

2022-11-23_4.9

- Changed tire temperature vs mu .luts
- Changed tire temperature vs level .luts (Routine change due to mu .lut change)
- Raised tire saturation peaks slightly
- Changed OEM tire load .luts
- Added bumpstop .luts
- Added install_k to bumpstops
- Corrected wrong humidity reference for engine
- Improved autoblip parameters (Autoblip driving aid only)

2022-11-05_4.8

- Changed tire stiffness, slip, flex, pressure, load and heat parameters
- Changed installation stiffness
- Changed wheel alignment range, step
- Changed Drift front spring range and default
- Changed Drift default wheel alignment
- Misc. changes

2022-08-19_4.7

- Changed standard engines
- Changed Drift dampers, implemented damper .luts
- Change to stabilizer installation stiffness
- Changed spring, stabilizer motion ratios
- Changed damper stroke ranges
- Tire changes
- AI changes

2022-06-07_4.6

- Changed tire slip parameters
- Minor engine adjustments

2022-04-24_4.5

- Changed rear motion ratio
- Changed unsprung masses
- Changed angular inertias
- Changed Drift rear spring options
- Changed Drift rear damper default setup
- Minor cleaning of files

2022-04-16_4.4

- Changed Drift rear tire default pressure from 30 to 25
- Minor corrections
- UI corrections

2022-04-05_4.3

- Changed specification of Drift tires
- Changed default damper clicks for Drift
- Raised maximum brake pressure in setup.ini to 120% for loadcell pedal users
- Changed automatic shifting parameters
- Cleaning of files

2022-03-27_4.2

- Added installation stiffness effect to corner springs
- Added chassis torsional stiffness effect to corner springs and stabilizers
- Changed default and adjustment range of Drift springs and dampers
- Corrections (?) to bumpstops/packers
- Correction (?) to rear motion ratio
- Corrected TBR for Torsen based on better data
- Changed ABS actuation threshold
- Changed EBD ratio curve
- Adjusted collider.ini
- Adjusted 3D height
- Minor cleaning up of files

06.03.2022 Version 4.1

- General changes
- Changed default setup for Drift
- Changed setup options for Drift

15.01.2022 Version 4.0

- Tire changes
- Global updates

31.12.2021 Version 3.9

- Adjusted "bushing rates" to be a bit more reasonable
- Thanks to @baker7498 and @JPG_18 for advice
- Adjusted heating parameters of tires
- Adjusted vertical rates of tires
- Adjusted load curves of tires
- Adjusted EBD
- Adjusted FFMULT

28.12.2021 Version 3.8

- Adjusted temperature vs mu curve of tires
- Adjusted heating parameters of tires
- Lowered threshold for ABS operation

16.12.2021 Version 3.7

- Changed temperature vs mu curve of tires
- Changed temperature vs level curve of tires
- Changed temperature vs speed curve of tires
- Changed slipcurve of tires
- Changed vertical and longitudinal aerodynamics
- Lowered threshold for ABS operation
- Adjusted FFMULT

01.12.2021 Version 3.6

- Added more controllers to EBD, changed .lut behavior
- Added side force to lateral aerodynamics
- Changed lateral aerodynamic side drag
- Adjusted FFMULT
- Misc. updating and standardizing

24.10.2021 Version 3.5

- Corrected (?) front LBJ, UBJ and steering rack placement
- Changed EBD .lut
- Corrected faulty ctrl_ebb.ini

22.10.2021 Version 3.4

- Corrected (?) standard front caster to align with height spec
- Changed EBD .lut
- Global updates

29.09.2021 Version 3.3

- Changed default and optimal pressures of tires
- Added camber vs tire springrate .luts

25.09.2021 Version 3.2

- Changed characteristics of "passenger" tire heating
- Changed Spirit R tire heating from "sport" to "passenger"
- Tire changes

08.09.2021 Version 3.1

- Implemented CSP damper luts to Spirit R for slightly more accurate curves
- Tire changes

12.08.2021 Version 3.0

- Standardized some things in syntax, minor tire changes

04.08.2021 Version 2.9

- Changed torque bias ratio assumption for LSD
- Tire stiffness changes
- Misc. changes

26.07.2021 Version 2.8

- Standardization and corrections to AI
- Standardization and corrections to autoshifter

31.05.2021 Version 2.7 Get it while you can

- Adjusted inertia (AC uses sprung input) thanks @JPG_18
- Adjusted CG
- Adjusted front and rear geometry based on Mazda schematic
- Changed some stabilizer parameters
- Changed motion ratios
- Removed "toe compliance" in rear
- Changes to engines
- Tire changes
- Minor aero changes

27.02.2021 Version 2.6

- New CSP Extended Physics heating for tires
- New CSP Extended Physics tire features for slip, self aligning torque, camber etc.
- New CSP Extended Physics suspension features
- New logic for tire load curves, combined grip
- Tire changes, standardization
- More accurate stabilizers based on new data, more options
- Changed damper rates based on better data
- More accurate mass, CoG based on better data
- Re-implemented wheel bushing rates
- Changed torque curves a bit
- Changed sequential turbo operation a bit
- Changed Drift to higher spec engine
- Added 13B-REW (Early); for mod makers
- Added S6 spec brakes; for mod makers
- Changed S8 spec brakes, EBD
- Changed some setup options, alignment
- Changed aero a bit to align with more accurate models
- More accurate yaw drag from new data model
- Updated UIs
- Changed configs to ext_config

05.07.2020 Version 2.5

- Differentiated DY and DX load curves for tires
- Adjusted tires
- Changed rubber bushings to solid/unwound rubber; thanks to @baker7498
- Changed aero.ini version to 3 so YAW_CL_GAIN works; oops!
- Changed front geos to slightly more accurate "EX=2" variation; no engine forces on the axle so no need to adjust; oops!
- Reverted trail changes; too subjective currently and likely more wrong than without
- Updated UIs

02.06.2020 Version 2.4

- Redid rear geometry for better accuracy
- Moved front suspension trail axis forward, alleviates some bad FFB from physics discrepancy
- Tidied up some files

07.05.2020 Version 2.3

- Changed Spirit R sta-bar wall thicknesses, thanks to @baker7498
- Changed sta-bar bushing stiffnesses
- Changed Drift handbrake to stronger variation
- Modified inertia based on new data
- Modified CoG height based on new data
- Modified rear wing drag(s) on tuned cars
- Changed FFB to be a little stronger
- Minor suspension corrections
- Tire changes

04.02.2020 Version 2.2

- Added Drift version
- Improved rear suspension geometry accuracy
- Added Street tires to higher tuned versions
- Small inertia change
- Made ebrake a bit weaker based on anecdote
- Maybe minor tweaks I forgot

10.01.2020 Version 2.1

- Aligned steering to original spec
- Aligned Spirit R geometries to Spirit R spec
- Removed (accidentally left in) height adjustment from Spirit R
- Changed EBD
- Tire changes

09.01.2020 Version 2.0

- Added Street 2000's tire
- Added load curves to tires
- Tire changes
- Found spring angles, droplink angles etc; not much change
- Minor suspension and setup tweaks
- Adjusted inertia
- Recalculated aero
- Added aero yaw drag fin
- Changed EBD
- Changed AWS in tuned cars
- Changed UIs for tuned cars

13.10.2019 Version 1.9

- Adjustment for damper oversight
- Calculated rollbars; didn't quite trust the old ones

27.09.2019 Version 1.8

- Changed geometries
- "Rubber bushing" ARB coeff from 0.4 to 0.5
- Changed AWS
- Removed AWS from S1 and S2
- Default SM tire pressure to 24, closer to ideal
- Tire changes
- Adjusted inertia
- Adjusted tuned cars LSD settings
- Removed tray adjustability from S3 and S4

27.08.2019 Version 1.7

- Changed front and rear geometry, a bit closer
- Changed brakes, EBD

10.08.2019 Version 1.6

- Added S4 version
- Added wing 3D replacement model and config by @Trawa#3727
- Changed S3 turbo and power.lut slightly
- Changed engine inertia, limiter hz in S3
- Some minor tire changes

26.07.2019 Version 1.5b

- Increased downforce and drag of S3 rear aerofoils to more realistic level

22.07.2019 Version 1.5

- Front motion ratio 0.630 -> 0.671 as per HKS
- Rear motion ratio 0.750 -> 0.714 as per HKS
- Default setups changed for tuned cars
- Geometry adjustments to tuned cars; rear LCA from adjusted to un-adjusted
- Rear bushing deflection added to S1 and S2; far less due to stiffer bushing
- S3 tire stiffness changed
- New tire camber values

15.06.2019 Version 1.4

- Weaker FFB to represent 1999+ powersteering changes
- S3 tire size changed from 255/255 to 265/265
- Added negative preload possibility to S3 ie: OS Giken
- Changed S3 springs from 22/20 to 18/18
- Changed S3 differential settings
- Changed S3 alignment
- Raised S3 front 10mm
- Changed S2, S3 dampers knee

31.05.2019 Version 1.3

- S3 folder name changed from "arch_mazda_fd3s_2002_s3" to "arch_mazda_fd3s_1999_s3"
- Adjusted sequential turbo minimum pressure based on better reference
- Added turbo adjustability to S3
- Added larger rear spring range to S3
- Added more precise ARB adjustment to S3
- Added one more step to S3 LSD adjustment
- S3 tire size changed from 235/255 to 255/255
- S3 standard rear toe per side increased
- S3 standard rear ARB increased
- S3 offset changed from ET50 to ET45
- S3 caster aligned to maximum OEM specification
- S2 rear ARB increased one step

29.05.2019 Version 1.2c

- Modified power curve close to and above rev limit as per suggestion: probably closer to reality

28.05.2019 Version 1.2b

- Added front undertray adjustability to S3

28.05.2019 Version 1.2

- Added S3 version
- Added yaw sensitivity to rear aerofoils that I overlooked

27.05.2019 Version 1.1

- Added S2 version
- Corrected faulty packers implementation for all cars

26.05.2019 Version 1.0c

- Corrected Spirit R height, alignment and ranges: oops!
- Changed S1 alignment slightly
- Put the S1 on a mild diet

25.05.2019 Version 1.0b

- Corrected EBD: logic mistake
- Changed ABS, brakes

25.05.2019 Version 1.0

- Added S1 version
- Added Semislicks tires
- Corrected tires dimensions
- Added more appropriate F6 camera

25.05.2019 Version 0.9RC6

- Implemented correct engine curve and turbos
- Corrected gauge boost pressure
- Updated UI

24.05.2019 Version 0.9RC5

- Implemented more accurate engine curve - not Spirit R spec yet
- Implemented more accurate turbochargers fuctionality
- Implemented Electronic Brake Distribution as per late-model FD3S
- Changed default brake bias

24.05.2019 Version 0.9RC4

- Implemented new aerodynamics to replace KS
- Changed alignment and ranges - thanks baker7498, mike12345678
- Changed bumpstops length 40mm -> 60mm
- Changed graphics offset
- Changed engine braking torque

23.05.2019 Version 0.9RC3

- Improved rear suspension geometry
- Updated ABS to V2 4-channel
- Changed ABS
- Changed AWS
- Changed diff lock %, oops! It's symmetrical both ways!
- Changed inertia
- Implemented (for real this time) real ARBs
- Changed graphics offset

22.05.2019 Version 0.9RC2

- Improved dampers
- Acquired and implemented (probably) real ARB
- Acquired and implemented (probably) real bumpstops
- Corrected rear MR

22.05.2019 Version 0.9RC

• Initial early release

!!!IMPORTANT!!!

Shaders patch required! Requires JDM Pack DLC by Kunos!

!!!IMPORTANT!!!

Includes:
RX-7 FD3S SPIRIT R Type A
RX-7 FD3S Drift

Credits:
Physics by Arch
Everything else by Kunos Simulazioni

Special thanks:
baker7498 for providing lots of data and literature
mike12345678 for providing lots of data and literature and a torque curve
Leonardo Ratafia for providing data

INSTALLATION INSTRUCTIONS:

The data.acd file is intended as a replacement used alongside the KS RX7 Spirit R visuals
or a fitting visual of your choosing. Visuals and sound are not bundled with the package.

How to install:

RECOMMENDED VISUALS AND SOUND

RX-7 FD3S SPIRIT R Type A: KS RX7 Spirit R and Spirit R sound
RX-7 FD3S Drift : KS RX7 Tuned and Tuned sound

Installation instructions

1.
Make 2 new folders on content\cars:
arch_mazda_fd3s_2002_spiritr
arch_mazda_fd3s_1999_drift

2.
Copy from folder ks_mazda_rx7_spirit_r
all these files to the new previously created folder:
arch_mazda_fd3s_2002_spiritr

3.
Copy from folder ks_mazda_rx7_tuned
all these files to the new previously created folder:
arch_mazda_fd3s_1999_drift

4.
Extract and replace all from the downloaded file

5. 
Use CM to Replace Sound

6.
Drag and drop "extensions" folder into AC directory
