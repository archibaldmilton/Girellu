# Honda NSX Physics Hotfix
Semi-official crash hotfix and physics patch for the NSX by Some1.

Uploading separately for convenience, we do not feel a real 3.1.0 is done yet.

https://www.racedepartment.com/downloads/honda-nsx.4768/

___
29.09.21 Hotfix D
- New method for determining optimal pressures of tires
- Added .luts for tire vertical springrate vs camber
- Adjusted cold pressures of tires
- Corrected OEM rear tire inflation pressure for H0 tires
- Minor param changes to H0 tires

25.09.21 Hotfix C
- Changed RE010 tire heating to "passenger" tire heating; peak temp at 50c
- Changed default and optimal pressures for tires
- Other tire parameter changes
- Raised FFMULT 10%
- Changed AD08R and A-022 shortnames to "SM"
- Added SPEED and RPM to extconfig for more natural gauge needle delay

12.08.21 Hotfix B
- Changed control logic of NA1 and NA2 TC
- Changed torque bias ratio assumption for NA2 Torsen II
- Standardized some things in syntax, minor tire changes

03.08.21 Hotfix A
- Lots of physics changes
- Minor UI changes
- Deleted RULES section from car.ini; should not crash anymore with affected CSP versions