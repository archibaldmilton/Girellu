!!!IMPORTANT!!!

Shaders patch 0.2.3+ required!

!!!IMPORTANT!!!

Includes:
Miata MX5 NA8C Base
Miata MX5 NA8C Drift

Credits:
Physics by Arch
Everything else by Kunos Simulazioni

Special thanks:
The usual suspects
CesarCardoso

RECOMMENDED VISUALS AND SOUND

Miata MX5 NA8C Base = KS Miata NA
Miata MX5 NA8C Drift = KS Miata NA

CHANGELOG

2025-03-29_A
- Changed script.lua to fix autoblip issue
- Changed brake booster

2025-03-08_A
- Changed brakes

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

2024-10-21_A
- Changed NA8C to Base model, removed PS and LSD
- Changed Drift to depowered PS rack
- Corrected steering parameters
- Changed drivetrain.ini hints

2024-10-15_A
- Changed NA8C reference brake foot force from 50kgf to 100kgf, setup max to 100%
- Changed NA8C rear disc from vented to solid
- Changed brakes

2024-09-20
- Changed reference brake foot force from 100kgf to 50kgf, setup max to 200%
- Changed tires heat, slip, load, wear etc.
- Changed "OEM" brake friction curve

2024-08-15
- Added steering U-joint nonlinearity (thanks @jpg_18, mod-talk)
- Changed tire thermals

2024-08-09
- Reverted from force to slip relax length
- Changed tire SAT, FALLOFF_SPEED, FALLOFF_YSPEED_MULT, FLEX_GAIN, heat_mu

2024-07-21
- Changed tires slip, heat

2024-07-10
- Changed tires camber curve

2024-06-08
- Corrections

2024-05-31
- Changed Drift tires from RE710 to RE710 / GLOBA
- Changed tires X_MULT, LEVEL, SPEED, FALLOFF_YSPEED_MULT, rolling resistance

2024-05-29
- Changed PS
- Changed tires slipcurve, combined grip, relax length, SAT
- Changed installation stiffness
- Changed suspensions.ini syntax
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
- Changed UI

2024-03-03
- Changed tire damping
- Changed tire rolling resistance
- Changed tire load curves (no performance change)
- Changed Drift default damping settings

2024-02-29
- Changed bumpstops

2024-02-26
- Changed tire load curves

2024-02-25
- Changed tire load curves, combined grip, camber_spring_k
- Changed PS map

2024-01-29
- Added wider brake torque range in setup.ini that I forgot to add

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
- Changed Drift default final gear

2023-11-14
- Added ackerman steering setup to Drift
- Changed toe setup from rack translation (vanilla) to steer rod length (Cosmic) where appropriate
- Changed syntax of setup options

2023-11-12
- Changed tire load curves
- Changed tire heat
- Changed brake heat
- Changed suspensions.ini syntax from POS0 to POS_A etc.
- Removed Front FLCA adjustment from Drift (CPU use optimization)

2023-08-06
- Added multiple loadpoint tire model
- Changed load, slip, combined grip, SAT, wear
- Changed tire thermal model version, temperature load biasing
- Corrections to positions of control arm BODYs
- Changed alignment setup ranges
- Removed incorrect hints from throttle.lut

2023-07-09
- Changed some BODY masses from 0.1kg to 1.0kg to prevent vibrations
- Changed suspensions.ini syntax

2023-07-08
- First COSMIC version, CSP 1.80+ compatibility only!
- Added object-based alignment, springs, dampers etc.
- Added chassis torsion flex
- Changed PS boost curve