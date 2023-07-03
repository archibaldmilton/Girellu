2023-07-03_5.5

- Removed car.ini ASSIST_TIME_CONSTANT
- Removed car.ini DAMPING_K_MIN

2023-06-26_5.4

- Changed combined grip
- Changed PS boost curve

2023-06-17_5.3

- Added brake heat
- Added powersteering for DD users (FFB TWEAKS)
- Changed SAT
- Changed load vs mu .luts
- Changed tire saturation peaks
- Changed FFMULT

2023-06-10_5.2

- Calibrated 100% brake torque to 50kg pedal force
- Changed slip and SAT
- Changed load vs mu .luts
- Changed CARCASS_ROLLING_K 0.21 to 0.25
- Changed FFMULT
- Changed tyres.ini indexing
- Added hints to load curve luts

2023-02-23_5.1

- Changed temperature vs slip .luts (large change when drifting)
- Changed load vs mu .luts

2022-12-19_5.0

- Adjusted normal suspension alignment height
- Adjusted alignment and alignment ranges
- Changed mass

2022-11-23_4.9

- Changed tire temperature vs mu .luts
- Changed tire temperature vs level .luts (Routine change due to mu .lut change)
- Raised tire saturation peaks slightly
- Changed OEM tire load .luts
- Changed OEM tire wear .lut
- Added bumpstop .luts
- Added install_k to bumpstops
- Corrected wrong humidity reference for engine
- Improved autoblip parameters (Autoblip driving aid only)

2022-11-05_4.8

- Changed tire stiffness, slip, flex, heat and load parameters
- Changed installation stiffness
- Changed front suspension geometry
- Changed rear suspension geometry
- Changed wheel alignment range, step
- Misc. changes

2022-08-19_4.7

- Change to spring and stabilizer motion ratio
- Change to spring and stabilizer installation stiffness
- Tire changes
- AI changes

2022-06-07_4.6

- Changed tire slip parameters
- Changed formula for wheelspeed / transfercase torque
- Added installation stiffness effect to corner springs
- Added chassis torsional stiffness effect to corner springs and stabilizers
- Adjusted front (open) diff lock
- Changed automatic shifting parameters
- Minor engine adjustments
- Minor cleaning of files

06.03.2022 Version 4.5

- General changes

15.01.2022 Version 4.4

- Tire changes
- Global updates

31.12.2021 Version 4.3

- Adjusted "bushing rates" to be a bit more reasonable
- Thanks to @baker7498 and @JPG_18 for advice
- Adjusted heating parameters of tires
- Adjusted vertical rates of tires
- Adjusted load curves of tires

28.12.2021 Version 4.2

- Adjusted temperature vs mu curve of tires
- Adjusted heating parameters of tires
- Adjusted default pressures for tires to be more suitable for circuit use
- Adjusted brake torque slightly lower
- Lowered threshold for ABS operation

23.12.2021 Version 4.1
- New implementation of ATTESA with closer replication of real maps
- Big thanks to @JPG_18 for solving most of the ATTESA implementation
- Adjusted ATTESA Tgain from some new data, thanks to @baker7498
- Modified control inputs of A-LSD
- Adjusted rebound rate of rear dampers

22.12.2021 Version 4.0
- New implementation of ATTESA
- New implementation of A-LSD
- Special thanks to @abbo90 and @baker7498
- Defaulted rear aerofoil to 0deg
- Added lag to gauges via extconfig

20.12.2021 Version 3.9

- Changed ATTESA and A-LSD inputs to use CSP axlespeeds input
- Changed AWD2 RAMP to be more proper
- Adjusted ATTESA and A-LSD LatG controllers
- Adjusted HICAS LatG controller

16.12.2021 Version 3.8

- Changed temperature vs mu curve of tires
- Changed temperature vs level curve of tires
- Changed temperature vs speed curve of tires
- Changed slipcurve of tires

01.12.2021 Version 3.7

- Changed vertical and longitudinal aerodynamics
- Added side force to lateral aerodynamics
- Changed lateral aerodynamic side drag
- Lowered ABS threshold
- Misc. updating and standardizing

22.10.2021 Version 3.6

- Adjusted front suspension geometry for more accurate trail
- Adjusted FFMULT
- Global updates

29.09.2021 Version 3.5

- Changed default and optimal pressures of tires
- Added camber vs tire springrate .luts

25.09.2021 Version 3.4

- Changed characteristics of "passenger" tire heating
- Changed vertical bushing stiffness based on anecdote
- HICAS roadspeed curve change
- HICAS yaw curve change (Wrong definition again)
- HICAS controller options merged into one file
- Corrected erroneous rear wheel alignment
- Aero changes
- Tire changes
- Small bugfix in A-LSD (upper limit left to wrong value, again)
- Corrected erroneous hints in ATTESA files
- UI name change

08.09.2021 Version 3.3

- ATTESA lock curve change
- ATTESA center diff max lock 600Nm -> 500Nm
- Removed "yaw compensation" from ATTESA; problematic to implement
- HICAS yaw curve change
- Tire changes
- Aero changes
- Changed bumpstop rates
- Lowered damping force at front rebound knee
- Minor torque curve changes
- Lowered FFMULT slightly
- Small bugfix in A-LSD (upper limit left to wrong value)

12.08.2021 Version 3.2

- Standardized some things in syntax, minor tire changes

04.08.2021 Version 3.1

- Tire stiffness changes
- Misc. changes

26.07.2021 Version 3.0

- Standardization and corrections to AI
- Standardization and corrections to autoshifter

31.05.2021 Version 2.9 Get it while you can

- Adjusted inertia (AC uses sprung input) thanks @JPG_18
- Implemented EX=2 to suspension, changed EX=0 variant to EX=2 !!USE CSP 0.1.74+!!
- Remade front and rear suspension geometry from better measurements
- Acquired more accurate motion ratios
- Acquired more accurate stroke ranges
- ATTESA/HICAS changes
- Changed many stabilizer specs
- Tire changes
- Other minor changes

28.02.2021 Version 2.81

- Actually added the new aero yaw drag that somehow got left out of 2.8; oops!
- Removed sfx folder from install; CSP required so everyone should be using sound replacement
- Minor folder cleanup

27.02.2021 Version 2.8

- Tire changes, standardization
- Changes to tire heating and luts
- Rescaled inertia box to better data and estimations
- More accurate yaw drag from new data model
- Minor changes
- Removed VAO patch from install due to worsening of visual quality; ilja pls fix
- Changed configs to ext_config

15.02.2021 Version 2.7

- Special thanks to @abbo90 / Giuseppe Abagnale and @baker7498 for help with ATTESA
- CSP version 0.1.68+ required, 0.1.72+ recommended
- Removed S versions to ease development
- New CSP Extended Physics heating for tires and brakes
- New CSP Extended Physics tire features for slip, self aligning torque, camber etc.
- New CSP Extended Physics suspension features
- New logic for tire load curves, combined grip
- Updated front geometry selection; for mod makers
- Updated rear geometry selection; for mod makers
- More accurate torque curve and boosts based on new data
- More accurate strokes, bumpstop lengths based on new data
- More accurate rear motion ratio based on new data
- More accurate alignment ranges based on new data
- More accurate stabilizer motion ratios, droplink angles
- New installation stiffness implementation for stabilizers
- Approximated tire/wheel/brake angular inertia 
- Made ackerman/wheel lock more accurate on front
- Minor changes to both geos
- Major ATTESA changes, new curves and better logic from data
- Major HICAS changes, new curves and better logic from data
- Major A-LSD changes, new curves and better logic from data
- Added documentation to ATTESA inside files; for mod makers
- More accurate mass, CoG based on better data
- Minor changes to aero, aero files structure
- Tire changes
- Second throttle map for hopefully more natural accelerator feeling
- Added up to date CSP configs

07.07.2020 Version 2.6

- Added roadspeed control to ATTESA to account for limitation, thanks @baker7498
- Removed incorrect controller entries from ATTESA
- Redone rear suspension geometry
- Adjusted rear bumpstops
- Adjusted front geometry based on new data
- Adjusted aero
- Differentiated DX and DY load curves in tires
- Tire tweaks
- Raised gain on S3 ATTESA LonG controller
- Lowered S3 rear diff power lock
- Changed graphics options (Camera, exposure etc.) in car.ini closer to KS values; maybe leftover
- Changed pitstop settings in car.ini closer to KS values; maybe leftover

07.05.2020 Version 2.5

- Improved rear suspension geometry accuracy
- ARB changes, thanks again to @Stereo, @baker7498
- Changed ATTESA curves
- Changed HICAS logic; old implementation was not working as intended
- Added brake proportioning valve effect via EBB, thanks to  @baker7498
- Weakened lock of V-spec LSD
- Inertia changes
- Tire tweaks
- Minor suspension corrections

02.01.2020 Version 2.4

- Derived front sta-bar wall thickness, motion ratio thanks to @baker7498

31.12.2019 Version 2.3

- General tire changes
- Added Street 2000's tire
- Added load curves to tires
- Recalculated aero
- Added aero yaw drag fin
- Found spring angles, droplink angles, more accurate sta-bar wall thickness etc.
- Minor suspension tweaks
- New brakes from data thanks to @baker7498
- Changed ATTESA lockup curve

13.10.2019 Version 2.2

- Calculated rollbars
- Changed rear MR based on new data
- Changed rollbar setup design for tuned cars
- Changed ATTESA lock curve
- Adjustment for damper oversight
- Removed TA; redundant and unsupported

27.09.2019 Version 2.1
 
- Changed rear geometry slightly
- Changed front rebound damper stroke 70mm -> 60mm
- Changed front bumpstop thickness 60mm -> 50mm
- Updated colliders from 4x to 2x
- Adjusted KERS and EDL value for new axlespeed that I forgot
- Default SM tire pressure to 24, closer to ideal
- Tire changes
- Accounted CoG for sprung mass calc
- Changed throttle graph
- Adjusted FFB

14.08.2019 Version 2.0

- Changed front UCA geometry to correct sizeable mistake
- Changed front UCA Z-coordinate placements a bit more accurate
- Made some sense of ARB rates and ARB motion ratios
- Changed brake bias 1% more forward
- Changed ABS
- Changed negative LonG ATTESA behavior
- Lessened preload in TA front differential

12.08.2019 Version 1.9b

- Changed rear ARBs slightly softer based on new data
- Changed default ARB setup for tuned cars
- Corrected wrong stock height and alignment: oops!


10.08.2019 Version 1.9

- Adjusted rear suspension
- Adjusted alignments
- Adjusted ATTESA lock curve slightly
- Some minor tire changes

26.07.2019 Version 1.8

- Changed S1 design
- Changed suspension strokes on S2, S3 and TA
- Adjusted RCAs and alignment on tuned versions
- New tire camber sensitivity values
- Adjusted tire peak slip
- Adjusted autoshifter and autoclutch

03.07.2019 Version 1.70b

- Changed rear tie rod position based on new data
- Fixed some left-over legacy values in S-cars
- Adjusted alignment range for rear camber
- Adjusted alignments

25.06.2019 Version 1.70

- Tweaked ATTESA LonG curve
- Tweaked ctrl_awd2.ini filter values
- Corrected bumpstops: I had misinterpreted data
- Adjusted toe geometry slightly
- Corrected rear positive camber setup option
- Corrected S3 vs TA front camber setup
- Removed HICAS from S2
- Adjusted FFB slightly higher
- Added empty.lut

15.06.2019 Version 1.60

- Added Time Attack version
- Split up old S3 into S3 and Time Attack
- Corrected rebound steps on S3: 17, not 16
- Changed S3 dampers knee

31.05.2019 Version 1.50c

• Suspension changes
	- Corrected alignment, ranges to be closer to reality
	- Adjusted S1 default alignment
	- Adjusted S2 default alignment
	- Increased S3 caster to maximum OEM specification
• Electronics changes
	- Remapped ATTESA lock curve slightly

29.05.2019 Version 1.50b

• Engine changes
	- Modified power curve close to and above rev limit as per suggestion: probably closer to reality
• Suspension changes
	- Corrected faulty packers implementation in all cars

19.05.2019 Version 1.50

• Suspension changes
	- Corrected stroke ranges
	- New damper design for S3
• Tire changes
	- Misc changes to slip behavior
• Engine changes
	- New engine design for S3
• Electronics changes
	- Remapped ATTESA lock curve slightly
• Aero changes
	- New sensitivity for chassis surfaces
	- Rear wing angle defaults to 30
• Other
	- UI rear ride height closer to real
	- Misc changes to drivetrain, engine
	- Adjusted inertia length lower
	- Misc UI changes

21.03.2019 Version 1.45

HUGE PHYSICS UPDATE

- Suspension changes
	- Corrected front geometry slightly
	- Redid rear geometry based on schematics and measurements: wrongly implemented before
	- Implemented S3 front camber arms to light tuned cars
- Electronics changes
	- Changed HICAS logic
	- Remapped some HICAS curves
	- Remapped ATTESA lock curve: more realistic mid-corner, exit and drift behavior
- Drivetrain changes
	- Removed front LSD from light tuned cars
	- Corrected some LSD preload values
- Misc changes
	- Added a nice, more appropriate F6 camera

15.03.2019 Version 1.4

Old setups are not compatible.

- Suspension changes
	- Corrected rear caster axis and upper arm wheel joint height
	- Result is closer camber/toe curve and hopefully more accurate coasting behavior
- Electronics changes
	- Adjusted ABS
- Brake changes
	- Adjusted bias
	- Adjusted force

13.03.2019 Version 1.35

- Tire changes
	- Changed grip dropoff and minimum level
	- Removed shader patch tire raytracing until fixed
- Suspension changes
	- Changed S3 version rebound valving
	- Removed HICAS from S3 version: for now just disabled
- Electronics changes
	- Adjusted ABS

08.03.2019 Version 1.32

- Removed height adjustability from stock: left in as a mistake from a dev testing build
- Corrected version moniker in car UI from 1.2 to 1.32

08.03.2019 Version 1.31

- Re-packed and re-uploaded files, in case of corrupted files
- IF YOU HAVE ISSUES WITH 1.3 DOWNLOAD THIS VERSION TO TRY


06.03.2019 Version 1.3

- ATTESA changes
	- Slight change in ATTESA preload behavior
	- Changed steer.lut 
- Tire changes
	- More accurate grip dropoff and minimum level
-Suspension changes
	- Slight change to rear tie-rod geometry
	- Modified anti-forces in rear geometry
	- Fixed measurement error in RLCA

15.02.2019 Version 1.2

- Added S2 version
- Added LonG ADD to ATTESA logic: still somewhat WIP
- Added pseudo-preload to more closely resemble R33 and R34 ATTESA
- Adjusted suspension forces
- Minor suspension design tweaks:
	- Wheel spacers to S2 and S3
	- Expanded, but also more closely resembling real-world part camber adjustability to tuned cars
- Minor tire physics changes
- Removed year indication from UI names: redundant due to CM functionality

12.02.2019 Version 1.1

- Added S3 version
- Minor physics changes
- A-LSD code minor bugfix
- Updated installation instructions

10.02.2019 Version 1.02 Hotfix to the hotfix!

- Removed KS R34 GT-R sound, as it is part of a paid DLC! I am very sorry for the inconvenience.

10.02.2019 Version 1.01 Hotfix

- Added sfx folder and R34 GT-R sound for ease of installing

Modified, scratchmade physics for R34 GT-R V-spec.

!!!IMPORTANT!!!

Requires shaders patch 0.1.74+! Requires JDM Pack DLC by Kunos!

!!!IMPORTANT!!!

Includes:
BNR34 V-spec

History:
The R34 began as a mod, 3D modeled by Ma7heus, and I worked alongside him, years ago. 
I wanted to do it like it should have always been.

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

GT-R V-spec = KS Skyline R34


