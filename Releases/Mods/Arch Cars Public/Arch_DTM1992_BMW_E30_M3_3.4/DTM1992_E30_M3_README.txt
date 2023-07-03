2023-06-26_3.4

- Changed foldername to arch_dtm1992_bmw_e30_m3_evo3
- Changed load vs mu .luts
- Changed combined grip

2023-06-17_3.3

- Added brake heat
- Changed SAT
- Changed load vs mu .luts
- Changed tire saturation peaks
- Changed default brake bias
- Changed FFMULT


2023-06-10_3.2

- Changed foldername to arch_bmw_e30_1992_m3_dtm
- Big correction (?) to Normallage definition/design height
- Calibrated 100% brake torque to 50kg pedal force
- Changed BASEY
- Changed front suspension geometry
- Changed rear suspension geometry
- Changed default setup
- Changed setup ranges
- Changed slip and SAT
- Changed load vs mu .luts
- Changed CARCASS_ROLLING_K 0.21 to 0.25
- Changed FFMULT
- Changed tyres.ini indexing
- Added hints to load curve luts

2022-06-25_3.1

- Implemented helper springs
- Changed weight distribution
- Changed installation stiffness (removed hacky bending stiffness)
- Changed front geometry for more accurate steering axis, bumpsteer
- Changed rear geometry to more accurate measurements
- Tire changes
- Setup changes
- Correction to LSD options, thanks @René#6467
- Misc. corrections
- UI changes
- Added VAO patch to download
- Removed left-over config files from download

2022-06-07_3.0

- Changed tire slip parameters
- Added chassis bending stiffness effect to corner springs and stabilizers
- Minor UI change

2022-04-05_2.9

- Corrected broken LSD (Forgot to rename drivetrain.ini .lut entry)
- Raised maximum brake pressure in setup.ini to 120% for loadcell pedal users
- Changed automatic shifting parameters
- Cleaning of files

2022-03-27_2.8

- Added installation stiffness effect to corner springs
- Added chassis torsional stiffness effect to corner springs and stabilizers

06.03.2022 Version 2.7

- General changes
- Typo fix in suspensions.ini (Does not affect car behavior)

15.01.2022 Version 2.6

- Corrected car mass
- Changed front MR
- Adjusted unsprung mass
- Tire changes
- Removed Pirelli tires
- Changed AI shifting 50 RPM lower for better shifts
- Changed UI
- Global updates

31.12.2021 Version 2.5

- Adjusted heating parameters of tires
- Adjusted vertical rates of tires

28.12.2021 Version 2.4

- Adjusted temperature curves of tires
- Adjusted heating parameters of tires
- Lowered threshold for ABS operation

16.12.2021 Version 2.3

- Changed temperature vs mu curve of tires
- Changed temperature vs level curve of tires
- Changed temperature vs speed curve of tires
- Changed slipcurve of tires
- Changed vertical and longitudinal aerodynamics
- Added side force to lateral aerodynamics
- Changed lateral aerodynamic side drag
- Misc. updating and standardizing

29.09.2021 Version 2.2

- Changed default and optimal pressures of tires
- Added camber vs tire springrate .luts
- Minor tire parameter changes
- Changed front unsprung mass

25.09.2021 Version 2.1

- Removed GRAIN from tires

04.08.2021 Version 2.0

- CSP version 0.1.68+ required, 0.1.74+ recommended
- Split into own version
- New CSP Extended Physics heating for tires
- New CSP Extended Physics tire features for slip, self aligning torque, camber etc.
- New CSP Extended Physics suspension features
- New logic for tire load curves, combined grip
- New more accurate front strut geometry, requires CSP Strut FFB fix
- New more accurate rear semi-trailing arm suspension design
- New stabilizers from new data and bladed ARB calculation, thanks to @Abbo90, @JPG_18 and others
- Adjusted inertia (AC uses sprung input) thanks @JPG_18
- Corrected many specs from homologation, manual, catalog etc. data
- Corrected track widths and wheel offsets
- Modified engine torque curves, inertia
- Modified damping curve, added more options
- Second throttle map for hopefully more natural accelerator feeling
- Adjusted CoG, colliders, UI and many other small fixes
- Changed yaw drag
- Added up to date CSP configs
- Misc. corrections and fixes

!!!IMPORTANT!!!

Requires shaders patch!

!!!IMPORTANT!!!

Includes:
BMW M3 E30 Sport Evolution DTM 1992

Credits:
Physics and custom UI file by Arch/Kyuubeey
UI file torque curves by x4fab's AC Torque Helper
Everything else by Kunos Simulazioni
Special thanks to: 
@baker7498, @mike12345678, @Leonardo Ratafiá among others
for data and help
@kondor999 for testing and feedback
@René#6467 for data

RECOMMENDED VISUALS AND SOUND

M3 E30 DTM = KS M3 E30 DTM

