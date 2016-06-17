# Convert between Km/h or Miles/h and Mach speeds
#
# Mach Number:
#
# Ratio of true airspeed to speed of sound in surrounding fluid (which varies as square
# root of absolute temperature). Mach 1 equals the speed of sound, which is 340.294 meters
# per second or 761.59 mph at sea level.
#
# The Mach number depends on the speed of sound in the gas and the speed of sound depends
# on the type of gas and the temperature of the gas.
#
# For the purposes of this class the gas is assumed to be common air.
#
# Default air temperature is the global average temperature at ground level.
#
# Usage:
#
# m = MachSpeedCalulator.kmh_to_mach(120, 25)
# => 0.0962977998319029
#
# km = MachSpeedCalulator.mach_to_kmh(0.0962977998319029, 25)
# => 120.0
#

require "math"

module MachSpeedCalculator
  extend self

  GROUND_AIR_TEMP_C  = 15
  GROUND_AIR_TEMP_F  = 59
  KELVIN_TO_CELCIUS  = 273.15
  KNOTS_TO_KM        = 0.5399568
  THE_MAGIC_CONSTANT = 38.967854

  # ------------------------------ Public Methods ------------------------------ #

  # Km/h to Mach
  def kmh_to_mach(km_per_hour, outside_air_temp_c = GROUND_AIR_TEMP_C)
    (KNOTS_TO_KM * km_per_hour) / (THE_MAGIC_CONSTANT * Math.sqrt(outside_air_temp_c + KELVIN_TO_CELCIUS))
  end

  # Mach to Miles/h
  def mileh_to_mach(miles_per_hour, outside_air_temp_f = GROUND_AIR_TEMP_F)
    kmh_to_mach(mile_to_km(miles_per_hour), fahr_to_celc(outside_air_temp_f))
  end

  # Mach to Km/h
  def mach_to_kmh(mach, outside_air_temp_c = GROUND_AIR_TEMP_C)
    (mach * (THE_MAGIC_CONSTANT * Math.sqrt(outside_air_temp_c + KELVIN_TO_CELCIUS))) / KNOTS_TO_KM
  end

  # Mach to Miles/h
  def mach_to_mileh(mach, outside_air_temp_f = GROUND_AIR_TEMP_F)
    km_to_mile(mach_to_kmh(mach, fahr_to_celc(outside_air_temp_f)))
  end

  # -------------------- Private Methods --------------------

  private def mile_to_km(miles)
    miles * 1.609344
  end

  private def km_to_mile(km)
    km * 0.621371192
  end

  private def fahr_to_celc(fahr)
    (fahr - 32) * 0.56
  end
end

