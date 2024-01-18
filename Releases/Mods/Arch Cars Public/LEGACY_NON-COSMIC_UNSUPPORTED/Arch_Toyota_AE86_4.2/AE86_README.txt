2023-06-26_4.2

- Changed combined grip

2023-06-17_4.1

- Added brake heat
- Changed SAT
- Changed load vs mu .luts
- Changed tire saturation peaks

2023-06-10_4.0

- Calibrated 100% brake torque to 50kg pedal force
- Changed slip and SAT
- Changed load vs mu .luts
- Changed CARCASS_ROLLING_K 0.21 to 0.25
- Changed FFMULT
- Changed tyres.ini indexing
- Added hints to load curve luts
- Changed 3D offset to better match some 3D replacements

2023-02-15_3.9

- Changed temperature vs slip .luts (large change when drifting)
- Changed load vs mu .luts

2023-01-01_3.8

- Removed GT-APEX, S1, S2 for dev-time reasons
- Changed tires
- Changed installation stiffness
- Improved autoblip parameters (Autoblip driving aid only)
- Corrected wrong humidity reference for engine

2022-06-07_3.7

- Changed tire slip parameters
- Changed automatic shifting parameters
- Changed "Neova A038" to "Advan A038"
- Minor cleaning of files

2022-03-27_3.6

- Changed range of springs on Drift and S2
- Added installation stiffness effect to corner springs
- Added chassis torsional stiffness effect to corner springs and stabilizers
- Minor cleaning of files

06.03.2022 Version 3.5

- General changes
- Changed wear .lut of GTV and S1 tires
- Corrected load index in GTV and S1 tyres.ini hints

15.01.2022 Version 3.4

- Tire changes
- Global updates

31.12.2021 Version 3.3

- Adjusted "bushing rates" to be a bit more reasonable
- Thanks to @baker7498 and @JPG_18 for advice
- Adjusted heating parameters of tires
- Adjusted vertical rates of tires
- Adjusted load curves of Drift tires
- Changed S2 default front dampers to 1 tick stiffer

28.12.2021 Version 3.2

- Adjusted temperature vs mu curve of tires
- Adjusted heating parameters of tires

16.12.2021 Version 3.1

- Changed temperature vs mu curve of tires
- Changed temperature vs level curve of tires
- Changed temperature vs speed curve of tires
- Changed slipcurve of tires
- Changed vertical and longitudinal aerodynamics
- Added side force to lateral aerodynamics
- Changed lateral aerodynamic side drag
- Misc. updating and standardizing

22.10.2021 Version 3.0

- Changed Drift UI description
- Global updates

29.09.2021 Version 2.9

- Changed default and optimal pressures of tires
- Added camber vs tire springrate .luts

25.09.2021 Version 2.8

- Removed GRAIN from S2 tires
- Changed RE710 tire heating from "sport" to "passenger"
- Changed characteristics of "passenger" tire heating
- Tire changes

08.09.2021 Version 2.7

- Changed specs of front stabilizer
- Changed default compound in Drift to RE710 F/R
- Changed maximum sidebrake torque
- Corrected wrong 1st gear spec in 116-028-AA
- Tire changes

12.08.2021 Version 2.6

- Standardized some things in syntax, minor tire changes

04.08.2021 Version 2.5

- Tire stiffness changes
- Added "passenger" heating
- Misc. changes

26.07.2021 Version 2.4

- Changed some tire characteristics to better align with new information
- Corrected exposure in car.ini
- Standardization and corrections to AI
- Standardization and corrections to autoshifter

20.07.2021 Version 2.3

- Increased grip of RE86 (GTV) and A-450 (S1) in response to new information
- Tweaked OEM tires' stiffnesses in response to new information
- Small oversight corrections to tires

15.07.2021 Version 2.2

- Updated tires
- Changed many stabilizer specs
- Changed spec of traction brackets and equal length arms on S2
- Changed spec of engine on S2
- Changed stock LSD preload spec
- Changed some setup specs
- Fixed typos in files

08.03.2021 Version 2.1

- Adjusted inertia (AC uses sprung input) thanks @JPG_18
- Added in CSP differential luts for setup
- Added in brake bias adjustment to S2 based on propvalve specs
- Measured suspension geometries from brochure schematics
- Remeasured motion ratios and damper/spring angles for both axles more properly
- Changed stroke lengths
- Changed LSD characteristics
- Changed tire wear curves
- Changed GTV unsprung mass to include steel wheels
- Corrected front standard track from 1.335 to 1.355; typo
- Minor typo fixes, UI changes, visual offset change etc.

03.03.2021 Version 2.0

- Added AE86 GTV Sprinter Trueno
- Changed specification of S1 version
- Corrected factory engine, tire, springs, dampers, CoG from better data
- Corrected some specifications in aftermarket parts from better data
- Corrected GT-APEX tire and wheel to correct (?) spec
- Corrected GT-APEX mass to correct (?) spec
- More accurate front geometries; use CSP FFB Tweaks Strut FFB adjustment
- Minor corrections to rear geometry measurements from TRD schematic
- Changed some aero curves
- Folder and UI restructure
- Minor corrections

28.02.2021 Version 1.91

- Actually added the new aero yaw drag that somehow got left out of 1.9; oops!
- Removed sfx folder from install; CSP required so everyone should be using sound replacement
- Simplified Drift aero just a bit; spoiler replaced by rear lift mult
- Minor folder cleanup

27.02.2021 Version 1.9

- Added back S2 version
- Tire changes, standardization
- More accurate yaw drag from new data model
- Minor changes, standardization
- Changed configs to ext_config

21.02.2021 Version 1.8

- CSP version 0.1.68+ required, 0.1.72+ recommended
- Removed S2 and Club versions to ease development, for now
- New CSP Extended Physics heating for tires
- New CSP Extended Physics tire features for slip, self aligning torque, camber etc.
- New CSP Extended Physics suspension features
- New logic for tire load curves, combined grip
- Re-measured rear geometry yet again
- Changed rear geometry from 5-link to 4-link to alleviate serious binding issue
- Lowered CoG, changed inertias
- Modifications to torque curves
- Minor changes here and there
- Added up to date configs

06.08.2020 Version 1.7

- Modified rear geometries to alleviate bounciness/binding in suspension
- Checked and standardized tires a little
- Minor setup changes
- Modifications to torque curves
- Changed frontal surface area in aero to more accurate value
- Removed SV90 and ST tires from stock; SV90 redundant and ST too high performance
- Reverted trail changes; too subjective currently and likely more wrong than without
- Maybe fixed head position for VR users?

06.06.2020 Version 1.6

- Moved front suspension trail axis forward, alleviates some bad FFB from physics discrepancy
- Added brake proportioning valve effect via EBB, thanks to  @baker7498
- Added "junkyard tire" to Drift
- Added spring bumpstop via BUMPSTOP_UP; packers don't work, and even this one is too stiff; whatever
- Corrected stock spring bumpstop distance; it's not on the shaft, it's separate! Yes I am stupid
- Corrected VERSION=2 to VERSION=4 in suspensions.ini so ATTACH_REL_POS works; yes I am stupid
- Corrected stock engine spec to 130ps as per JDM spec
- Corrected stock engine fuel cut to 7700RPM as per spec
- Corrected TORQUE_REACTION in stock car; was 0 for testing
- Corrected oversight in stock 86 front suspension; height was with no driver
- Changed rear suspension for more proper internal force correction
- Changed stock damping based on new reference
- Changed height range on the D, S2 and Club to be wider
- Changed S2 rear geometry spec to slightly lower grade again
- Changed S2 springs from 8.0 / 7.0 to 9.0 / 8.0
- Changed S1 rear spring from 4.0kgf/mm to 4.7kgf/mm
- Changed D LSD to Cusco type
- Tire changes
- Tidied up some files a bit
- Updated UIs

04.04.2020 Version 1.5

- Changed motion ratio for front
- Changed rear geometry
- Changed S2 rear geometry to higher performance variant
- Tire changes
- Corrected fins for some versions
- Changed brake force for some versions
- Increased FFB strength a little
- Updated UIs

09.12.2019 Version 1.4

- Implemented custom load curves to tires
- Tire tweaks
- Added Slicks to Club as default
- Changed ARBs and ARB setup
- Added control arm connection ARB adjustment to S2 and Club
- Adjusted panhard and trailing links setting on S2 and Club based on new data/understanding
- Made some sense of the steering racks and geometries between Manual/PS; existing cars slightly changed
- Bunch of small suspension changes to both axles
- Tweaked aero
- Re-calibrated UI ride height
- Updated UIs

20.10.2019 Version 1.3

- Modified rear suspension geometry
- Calculated ARBs (Was very off before)
- Changed inertia
- Added yaw-drag from fin
- Tweaked stock LSD, tuned LSD options
- Added ECO tire to stock and Drift
- Defaulted Drift to ECO
- Tire tweaks
- Removed tire camber lookup tables
- Setup changes
- Changed throttle graph
- Other small changes I've forgot
- Removed Drift Alt (For now?)

06.08.2019 Version 1.3 THE UPDATE WHICH NEVER WAS

- Implemented tire camber lookup tables
- Overall tire tweaks
- Suspension stroke and design tweaks/fixes
- Probably other stuff I have forgot by now
- Removed Rally version; unsupported as of now

15.05.2019 Version 1.2b

- Fixed a few oversights/bugs

12.05.2019 Version 1.2

- Added AE86 GT-APEX Sprinter Trueno Club racing version
• Racing version using mainly classic parts
- Added AE86 GT-APEX Sprinter Trueno Rally racing version
• Rally version loosely based on WRC A/6 and Finnish Corolla GT cars
• Not complete yet and needs some work but maybe it's fun for some
- Changed AE86 GT-APEX Sprinter Trueno Drift Alt
• Serious drift version with S13 front end swap
- Added "Street 80's" tires to stock car, maybe closer to tire from 1983

- Changed tire values for all cars
- Redone rear geometry
- Corrected front geometry slightly
- Corrected alignments and range
- Changed inertia box: smaller, was a bit excessive
- Changed CoG, fuel tank position, mass for all cars
- Corrected bumpstops implementation: Thanks Kade, mclarenf1papa
- Corrected coasting torque values
- Corrected stock fuel cut RPM: suggest using Tuned sound
- Changed stock LSD preload and lock %
- Changed stock front rebound damping

- Corrected idle RPMs for all engines
- Misc engine and transmission changes
- Misc changes allround
- Corrected drag from Coupe values to Hatch
- Corrected visuals 10mm higher
- Corrected physics ride heights and UI display slightly
- Corrected toe value display for setup
- Added a nice, more appropriate F6 camera
- Corrected typo in some descriptions: Thanks Venitros

14.03.2019 Version 1.1

- Changed driftcar default setups a bit
- Updated UI
- Attempted to improve live axle implementation: probably as good as it will get


10.03.2019 Version 1.0 

- Initial release

Scratchmade physics for Toyota AE86

Includes:
AE86 1600GTV Sprinter Trueno
AE86 Sprinter Trueno Drift

Credits:
Physics and custom UI file by Arch/Kyuubeey
Version icons by x4fab's Content Manager
UI file torque curves by x4fab's Content Manager
Extensions configs by x4fab's Content Manager
Everything else by Kunos Simulazioni

Special thanks:
Venitros for driving car in testing
Aphidgod, stereo, mclarenf1papa, Leonardo Ratafiá, Kade and many others for help
baker7498 for finding a ton of data

RECOMMENDED VISUALS AND SOUND

AE86 GTV = KS AE86 Visuals, KS AE86 Tuned Sound
AE86 Drift = KS AE86 Drift Visuals, KS AE86 Tuned Sound



