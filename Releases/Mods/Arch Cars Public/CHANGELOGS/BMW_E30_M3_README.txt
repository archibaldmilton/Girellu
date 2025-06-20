!!!IMPORTANT!!!

Shaders patch 0.2.8+ required!

!!!IMPORTANT!!!

Includes:
E30 M3
E30 M3 Drift

Credits:
Physics by Arch
Everything else by Kunos Simulazioni

Special thanks to: 
@baker7498, @mike12345678, @Leonardo Ratafiá among others
for data and help
@Matt for helping with Drift version
@kondor999 for testing and feedback

CHANGELOG

2025-06-21_A
- Changed tires rolling resistance, SAT

2025-06-17_A
- Changed 08D load curves, rolling resistance
- Corrected bushing preload

2025-06-12_A
- Changed tires load, slip, pressure

2025-06-04_A
- Added ABS uneven friction logic

2025-05-25_A
- Changed COMBINED_FACTOR

2025-05-24_A
- Changed brake heat
- Corrected "bushings" to act as pull springs

2025-05-17_A
- Changed tires load curve

2025-05-16_A
- Changed ABS
- Changed aero

2025-05-14_B
- Changed stabilizers

2025-05-14_A
- Added Cphys ABS (CSP 0.2.8+ required!)
- Corrected welded diff setup option

2025-05-05_A
- Changed load curve mu
- Changed brake booster curve

2025-05-03_A
- Changed tires combined grip
- Changed ABS slip goal, frequency

2025-05-01_A
- Changed tires LEVEL, YMULT
- Changed handbrake
- Changed aero
- Removed Drift compliant rack

2025-04-28_A
- Fixed Drift tires.ini camber lut reference

2025-04-26_A
- Changed tires
- Changed ARB
- Changed PS

2025-04-16_A
- Changed aero

2025-04-07_A
- Updated engines for better idle handling
- Updated script.lua to fix? idle/coast? bug again

2025-04-06_A
- Changed Drift rack mass, damping
- Changed bushings

2025-03-29_A
- Changed script.lua to fix autoblip issue

2025-03-08_A
- Changed brakes
- Changed ABS slipratio goal

2025-03-03_A
- Added LUA throttle, idle, coast model by @switchpro, @ustahl, @jpg_18
- Corrected brake pressure
- Changed handbrake torque

2025-02-09_A
- Added bushing vertical damping
- Changed bushing vertical rates
- Changed stabilizer installation stiffness

2025-01-14_A
- Added hard rate point to steering rack lateral deflection
- Changed tires

2024-12-30_A
- Added 10m/s point to damper luts
- Added steering rack lateral deflection to Drift
- Removed chassis torsion flex
- Changed tire slip, load, camber, SAT
- Changed corner spring installation stiffness
- Changed Drift dampers

2024-10-15_A
- Changed P600 heat
- Changed brakes

2024-09-20
- Changed reference brake foot force from 100kgf to 50kgf, setup max to 200%
- Changed tires heat, slip, load, wear etc.
- Changed "OEM" brake friction curve
- Changed stabilizers
- Changed ABS

2024-08-15
- Added steering U-joint nonlinearity (thanks @jpg_18, mod-talk)
- Changed tire thermals
- Changed M3 tire load curve

2024-08-09
- Reverted from force to slip relax length
- Changed tire SAT, FALLOFF_SPEED, FALLOFF_YSPEED_MULT, FLEX_GAIN, heat_mu

2024-07-31
- Changed M3 tire load curve

2024-07-21
- Changed tires slip, heat

2024-07-10
- Changed tires camber curve

2024-06-08
- Changed Drift dampers

2024-06-01
- Removed front elastokinematic toe compliance (FFB vibration)

2024-05-31
- Changed Drift tires from Z1SS to 08D
- Changed tires X_MULT, LEVEL, SPEED, FALLOFF_YSPEED_MULT

2024-05-29
- Changed PS
- Changed tires slipcurve, combined grip, relax length, SAT
- Corrections

2024-05-17
- Changed stabilizers

2024-05-10
- Added elastokinematic toe compliance to road M3
- Changed stabilizers
- Changed spring installation stiffness
- Corrections

2024-03-22
- Changed tire damping

2024-03-17
- Changed tire damping
- Changed tire rolling resistance

2024-03-10
- Changed tire damping

2024-03-05
- Changed tire load curves (no performance change)
- Changed Drift UI

2024-03-03
- Changed tire damping
- Changed tire rolling resistance
- Changed tire load curves (no performance change)
- Changed Drift default damping settings
- Changed Drift wheel offset

2024-02-29
- Changed bumpstops

2024-02-26
- Changed tire load curves

2024-02-25
- Minor tire changes

2024-02-18
- Changed tire load curves, combined grip, camber_spring_k
- Changed rear suspension geometry
- Changed Drift rear toe alignment step from 5 to 1
- Changed 3D offset
- Fixed typos in suspensions.ini hints

2024-01-27
- Added extended brakes system, realfeel
- Added booster servo saturation to torque calculation
- Calibrated brakes to 100kgf pedal
- Changed tire and brake thermals

2024-01-18
- Changed tire slip, load parameters

2023-12-24
- Added back Drift (Use CSP 0.2.2+)
- Changed tire thermal model to 1 (Less buggy)

2023-11-23
- Removed Drift
- Changed PS curve
- Changed tire SAT

2023-11-17
- Changed Drift steering geometry
- Changed Drift steering ratio (For more correct FFB)
- Misc. steering changes

2023-11-14
- Added ackerman steering setup to Drift
- Changed front suspension geometry
- Changed toe setup from rack translation (vanilla) to steer rod length (Cosmic) where appropriate
- Changed syntax of setup options

2023-11-12
- Changed front suspension geometry
- Changed tire load curves
- Changed tire heat
- Changed brake heat
- Changed suspensions.ini syntax from POS0 to POS_A etc.
- Disabled ABS in Drift
- Corrections to alignment

2023-08-06
- Added multiple loadpoint tire model
- Changed load, slip, combined grip, SAT, wear
- Changed tire thermal model version, temperature load biasing
- Changed alignment setup ranges

2023-07-09
- Changed some BODY masses from 0.1kg to 1.0kg to prevent vibrations
- Changed suspensions.ini syntax

2023-07-08
- First COSMIC version, CSP 1.80+ compatibility only!
- Added object-based alignment, springs, dampers etc.
- Added chassis torsion flex
- Changed PS boost curve for E30 rack
- Changed Drift spring options, default setup
- Removed Sport Evolution
- Changed UI