=begin
  Convert between Km/h or Miles/h and Mach speeds
 
  Copyright (c) 2007 Chris Cummer
    chris@postal-code.com
    
    This library is free software (as in beer and in speech); you may redistribute it and/or modify it
    under the same terms as the ruby language itself, see the file COPYING for details.
=end

=begin
    Mach Number:
    
      Ratio of true airspeed to speed of sound in surrounding fluid (which varies as square 
      root of absolute temperature). Mach 1 equals the speed of sound, which is 340.294 meters 
      per second or 761.59 mph at sea level.
    
      The Mach number depends on the speed of sound in the gas and the speed of sound depends 
      on the type of gas and the temperature of the gas.
    
      For the purposes of this class the gas is assumed to be common air.
    
    Usage:
    
      m = MachSpeedCalulator.new
      ms = m.kmh_to_mach( 120, 25 )
      => 0.0962977998319029
      
      km = m.mach_to_kmh( 0.0962977998319029, 25 )
      => 120.0
=end
class MachSpeedCalculator
  require 'bigdecimal/math'
 
  # ------------------------------ Initialization ------------------------------ #
 
 
  def initialize
    @knots_to_km_ratio = 0.5399568
    @kelvin_to_celcius = 273.15
    @the_magic_constant = 38.967854
  end
 
 
  # ------------------------------ Public Methods ------------------------------ #
 

  # Convert from Km/h to Mach
  def kmh_to_mach( kmh, pOutsideAirTempC = 15 )
    return ( @knots_to_km_ratio * kmh ) / ( @the_magic_constant * Math.sqrt( pOutsideAirTempC + @kelvin_to_celcius )  )
  end
  

  # Convert from Mach to Miles/h 
  def mileh_to_mach( mileh, pOutsideAirTempF = 59 )
    return kmh_to_mach( mile_to_km( mileh ), fahr_to_celc( pOutsideAirTempF ) )
  end


  # Convert from Mach to Km/h
  def mach_to_kmh( mach, pOutsideAirTempC = 15 )
    return ( mach * ( @the_magic_constant * Math.sqrt( pOutsideAirTempC + @kelvin_to_celcius ) ) ) / @knots_to_km_ratio
  end
  
  
  # Convert from Mach to Miles/h  
  def mach_to_mileh( mach, pOutsideAirTempF = 59 )
    return km_to_mile( mach_to_kmh( mach , fahr_to_celc( pOutsideAirTempF ) ) )
  end

private

  def mile_to_km( miles )
    return miles * 1.609344
  end
  
  
  def km_to_mile( km )
    return km * 0.621371192
  end
  
  
  def fahr_to_celc( f )
    return ( f - 32 ) * 0.56
  end
end


# ------------------------------ Test Code ------------------------------ #


def assert(cond)
	raise unless cond
end


if __FILE__ == $0  
  # Testing kmh_to_mach()
  assert( sprintf( "%0.4f", MachSpeedCalculator.new.kmh_to_mach( 100.0, 15 ) ) == "0.0816" )
  assert( sprintf( "%0.4f", MachSpeedCalculator.new.kmh_to_mach( 100.0, 45 ) ) == "0.0777" )
  assert( sprintf( "%0.15f", MachSpeedCalculator.new.kmh_to_mach( 655.7144, 10 ) ) == "0.539956736381214" )

  assert( sprintf( "%0.4f", MachSpeedCalculator.new.kmh_to_mach( 200.0, 15 ) ) != "0.09" )
    
  
  # Testing mach_to_kmh()
  assert( sprintf( "%0.4f", MachSpeedCalculator.new.mach_to_kmh( 0.0816, 15 ) ) == "99.9648" )
  assert( sprintf( "%0.4f", MachSpeedCalculator.new.mach_to_kmh( 0.0777, 45 ) ) == "100.0194" )
  assert( sprintf( "%0.10f", MachSpeedCalculator.new.mach_to_kmh( 1, 10 ) ) == "1214.3832196531" )
  
  assert( sprintf( "%0.4f", MachSpeedCalculator.new.mach_to_kmh( 0.09, 15 ) ) != "200" )
  
  
  # Testing mileh_to_mach
  assert( sprintf( "%0.4f", MachSpeedCalculator.new.mileh_to_mach( 100.0, 15 ) ) == "0.1373" )
  assert( sprintf( "%0.4f", MachSpeedCalculator.new.mileh_to_mach( 100.0, 45 ) ) == "0.1332" )

  assert( sprintf( "%0.4f", MachSpeedCalculator.new.mileh_to_mach( 200.0, 15 ) ) != "0.09" )
  
  
  # Testing mach_to_mileh()
  assert( sprintf( "%0.10f", MachSpeedCalculator.new.mach_to_mileh( 1, 10 ) ) == "724.2314159351" )
end