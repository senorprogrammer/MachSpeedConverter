# MachSpeedCalc

Convert between Km/h or Miles/h and Mach speeds.

## Mach Number

Ratio of true airspeed to speed of sound in surrounding fluid (which varies as square
root of absolute temperature). Mach 1 equals the speed of sound, which is 340.294 meters
per second or 761.59 mph at sea level.

The Mach number depends on the speed of sound in the gas and the speed of sound depends
on the type of gas and the temperature of the gas.

For the purposes of this class the gas is assumed to be common air.

Default air temperature is the global average temperature at ground level.

## Usage


    ms = MachSpeedCalulator.kmh_to_mach( 120, 25 )
    => 0.0962977998319029

    km = MachSpeedCalulator.mach_to_kmh( 0.0962977998319029, 25 )
    => 120.0
