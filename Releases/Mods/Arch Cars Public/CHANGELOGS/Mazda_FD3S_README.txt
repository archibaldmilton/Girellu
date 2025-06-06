!!!IMPORTANT!!!

Shaders patch 0.2.8+ required! Requires JDM Pack DLC by Kunos!

!!!IMPORTANT!!!

Includes:
RX-7 FD3S Spirit R Type A
RX-7 FD3S Drift

Credits:
Physics by Arch
Everything else by Kunos Simulazioni

Special thanks:
baker7498 for providing lots of data and literature
mike12345678 for providing lots of data and literature
animal3005 for providing lots of data and literature
Leonardo Ratafia for providing data

CHANGELOG

2025-06-04_A
- Added ABS uneven friction logic

2025-05-25_A
- Added ABS XG sensor
- Changed COMBINED_FACTOR
- Changed fuel tank position

2025-05-24_A
- Changed brake heat
- Corrected "bushings" to act as pull springs

2025-05-17_A
- Changed tires load curve

2025-05-16_A
- Changed ABS
- Changed aero

2025-05-14_A
- Added Cphys ABS (CSP 0.2.8+ required!)
- Changed EBB
- Changed tires CX_MULT
- Corrected welded diff setup option

2025-05-05_A
- Changed load curve mu
- Changed brake booster curve

2025-05-03_A
- Changed tires combined grip
- Changed ABS slip goal, frequency

2025-05-01_A
- Changed tires LEVEL, YMULT
- Changed Drift tires from 235/235 to 215/235
- Changed Drift spring setup range, default setup
- Changed handbrake
- Removed Drift compliant rack

2025-04-27_B
- Corrected minor Spirit R tire typo

2025-04-27_A
- Changed tires
- Changed EBB
- Changed Drift default setup

2025-04-16_A
- Removed LUT_GH_CD
- Changed Drift aero

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
- Changed Spirit R tire load curves

2025-02-11_A
- Added Spirit R rear elastokinematics

2025-02-09_A
- Added bushing vertical damping
- Changed bushing vertical rates
- Changed stabilizer installation stiffness
- Changed Spirit R front rebound length

2025-02-05_B
- Changed alignment range
- Changed Drift steering geometry, default alignment

2025-02-05_A
- Changed suspension geometries
- Changed stabilizer motion ratios
- Changed Spirit R bumpstop curves
- Changed Spirit R damper stroke

2025-02-03_A
- Changed unsprung masses, rotational inertias
- Changed suspension geometries
- Changed stabilizer motion ratios
- Changed brake thermal masses
- Changed sprung inertia
- Changed Drift alignment
- Changed readme credits

2025-02-01_A
- Removed Spirit R setup corner spring preload adjustment
- Changed Spirit R corner springs, dampers
- Changed Spirit R LSD
- Changed Spirit R EBB
- Changed Spirit R UI
- Changed stabilizers

2025-01-30_A
- Added Spirit R setup corner spring preload adjustment
- Changed Spirit R dampers
- Changed front steering geometries, nonlinearity
- Changed stabilizers
- Changed brake booster
- Changed PS
- Changed idle RPM
- Changed Camera 2, 3, 4 to internal sound

2025-01-29_A
- Recalibrated load curve grip for S-07

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

2024-10-21_A
- Changed SPRIT R LSD
- Changed brakes

2024-10-15_A
- Changed brakes

2024-09-20
- Changed reference brake foot force from 100kgf to 50kgf, setup max to 200%
- Changed tires heat, slip, load, wear etc.
- Changed stabilizers
- Changed ABS, EBB
- Minor changes

2024-08-15
- Added steering U-joint nonlinearity (thanks @jpg_18, mod-talk)
- Changed tire thermals

2024-08-09
- Reverted from force to slip relax length
- Changed tire SAT, FALLOFF_SPEED, FALLOFF_YSPEED_MULT, FLEX_GAIN, heat_mu
- Changed PS

2024-07-21
- Changed tires slip, heat

2024-07-10
- Changed tires camber curve

2024-06-08
- Changed Drift dampers

2024-05-31
- Changed Drift tires from Z1SS to 08D
- Changed tires X_MULT, LEVEL, SPEED, FALLOFF_YSPEED_MULT

2024-05-29
- Changed PS
- Changed tires slipcurve, combined grip, relax length, SAT

2024-05-17
- Changed stabilizers

2024-05-16
- Changed front geo
- Changed stabilizers
- Changed stiffness of bushing vertical rate
- Changed installation stiffness
- Changed ride height assumption
- Corrections

2024-03-22
- Changed tire damping

2024-03-17
- Changed tire damping

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

2024-02-29
- Changed bumpstops

2024-02-26
- Changed tire load curves

2024-02-23
- Changed tire load curves, combined grip, camber_spring_k

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
- Changed PS curve
- Changed Drift steering geometry
- Changed Drift steering ratio (For more correct FFB)
- Changed syntax of suspensions.ini
- Changed syntax of setup.ini

(2023-11-16)
- Corrected Spirit R preload

2023-11-14
- Added ackerman steering setup to Drift
- Changed toe setup from rack translation (vanilla) to steer rod length (Cosmic) where appropriate
- Changed syntax of setup options

2023-11-12
- Changed PS curve
- Changed stock handbrake torque
- Changed tire load curves
- Changed tire heat
- Changed brake heat
- Changed suspensions.ini syntax from POS0 to POS_A etc.
- Removed Front FLCA adjustment from Drift (CPU use optimization)
- Disabled ABS in Drift
- Corrections to alignment

2023-08-06
- Added multiple loadpoint tire model
- Changed load, slip, combined grip, SAT, wear
- Changed tire thermal model version, temperature load biasing
- Corrections to positions of control arm BODYs
- Changed alignment setup ranges

2023-07-09
- Added universal joint RLCA_HOOKES to RLCA_BODY to prevent rotation of RLCA_BODY
- Changed Rear FLCA from J to DJ, added length adjustability to Drift for tweaking bumpsteer
- Changed some BODY masses from 0.1kg to 1.0kg to prevent vibrations
- Changed suspensions.ini syntax

2023-07-08
- First COSMIC version, CSP 1.80+ compatibility only!
- Added object-based alignment, springs, dampers etc.
- Added chassis torsion flex
- Changed Drift spring options, default setup
- Minor change to car.ini GRAPHICS_PITCH_ROTATION