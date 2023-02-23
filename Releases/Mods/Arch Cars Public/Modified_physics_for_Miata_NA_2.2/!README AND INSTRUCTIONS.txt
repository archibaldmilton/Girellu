2023-02-23_2.2
- Added Drift
- Changed temperature vs slip .luts (large change when drifting)
- Changed load vs mu .luts

2022-12-29_2.1

- Removed S1 for dev-time reasons
- Changed tires
- Adjusted normal suspension alignment height
- Adjusted alignment and alignment ranges
- Improved autoblip parameters (Autoblip driving aid only)
- Corrected wrong humidity reference for engine

2022-06-07_2.0

- Changed tire slip parameters
- Correction to front and rear motion ratio

2022-04-16_1.9

- Raised maximum brake pressure in setup.ini to 120% for loadcell pedal users
- Changed automatic shifting parameters
- Minor corrections/changes
- Cleaning of files
- Changed UI name

2022-03-27_1.8

- Added installation stiffness effect to corner springs
- Added chassis torsional stiffness effect to corner springs and stabilizers
- Corrected TBR for Torsen based on better data
- Minor cleaning up of files

06.03.2022 Version 1.7

- General changes

15.01.2022 Version 1.6

- Tire changes
- Global updates

31.12.2021 Version 1.5

- Adjusted "bushing rates" to be a bit more reasonable
- Thanks to @baker7498 and @JPG_18 for advice
- Adjusted heating parameters of tires
- Adjusted vertical rates of tires
- Adjusted alignment range

28.12.2021 Version 1.4

- Adjusted temperature vs mu curve of tires
- Adjusted heating parameters of tires

16.12.2021 Version 1.3

- Changed temperature vs mu curve of tires
- Changed temperature vs level curve of tires
- Changed temperature vs speed curve of tires
- Changed slipcurve of tires

01.12.2021 Version 1.2

- Corrected rear stabilizer dimensions (Was using front for both probably); slightly higher rate
- Added side force to lateral aerodynamics
- Changed lateral aerodynamic side drag
- Misc. updating and standardizing

22.10.2021 Version 1.1

- Lowered CGH 5mm based on further examination of Mazda data
- Global updates

29.09.2021 Version 1.0

- Changed optimal pressures of tires
- Added camber vs tire springrate .luts

25.09.2021 Version 0.9

- Changed characteristics of "passenger" tire heating
- Tire changes

12.08.2021 Version 0.8

- Standardized some things in syntax, minor tire changes

04.08.2021 Version 0.7

- Changed torque bias ratio assumption for LSD
- Tire stiffness changes
- Added "passenger" heating
- Misc. changes

26.07.2021 Version 0.6

- Added NA8C S1
- Corrected NA8C tire size from 195/60R14 to 185/60R14 (Typo? Mixup with 195/50R15?)
- Corrected fuel capacity back to 48l (NA8C larger fuel tank)
- Changed some tire characteristics to better align with new information
- Standardization and corrections to AI
- Standardization and corrections to autoshifter

21.07.2021 Version 0.5

• Initial release

!!!IMPORTANT!!!

SHADERS PATCH REQUIRED!

!!!IMPORTANT!!!

Includes:
Mazda Miata MX5 NA8C
Mazda Miata MX5 NA8C Drift

Credits:
Physics and custom UI file by Arch/Kyuubeey
Versions icons by Content Manager
UI file torque curves by Content Manager
Everything else by Kunos Simulazioni

Special thanks:
The usual suspects
CesarCardoso

INSTALLATION INSTRUCTIONS:

The data.acd file is intended as a replacement used alongside the KS Miata visuals
or a fitting visual of your choosing. Visuals and sound are not bundled with the package.

How to install:

RECOMMENDED VISUALS AND SOUND

Mazda Miata MX5 NA8C : KS Miata and Miata sound
Mazda Miata MX5 NA8C Drift : KS Miata and Miata sound

Installation instructions

1.
make 2 new folders on content\cars:
arch_mazda_miata_na8c_1994
arch_mazda_miata_na8c_1994_drift

2.
copy from folder ks_mazda_miata
all files to the new previously created folders:
arch_mazda_miata_na8c_1994
arch_mazda_miata_na8c_1994_drift

3.
Extract and replace all from the downloaded file

4. 
use CM to Replace Sound and select the Kunos Miata
