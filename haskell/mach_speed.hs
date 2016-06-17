ground_air_temp_c  = 15
ground_air_temp_f  = 59
kelvin_to_celcius  = 273.15
knots_to_km        = 0.5399568
the_magic_constant = 38.967854

kmh_to_mach :: Float -> Float -> Float
kmh_to_mach km_per_hour outside_air_temp_c =
  (knots_to_km * km_per_hour) / (the_magic_constant * sqrt(outside_air_temp_c + kelvin_to_celcius))

mileh_to_mach :: Float -> Float -> Float
mileh_to_mach miles_per_hour outside_air_temp_f =
  kmh_to_mach (mile_to_km miles_per_hour) (fahr_to_celc outside_air_temp_f)

mach_to_kmh :: Float -> Float -> Float
mach_to_kmh mach outside_air_temp_c =
  (mach * (the_magic_constant * sqrt(outside_air_temp_c + kelvin_to_celcius))) / knots_to_km

mach_to_mileh :: Float -> Float -> Float
mach_to_mileh mach outside_air_temp_f =
  km_to_mile(mach_to_kmh mach (fahr_to_celc outside_air_temp_f))

{- -------------------- Helper Functions -------------------- -}

mile_to_km :: Float -> Float
mile_to_km miles = miles * 1.609344

km_to_mile :: Float -> Float
km_to_mile km = km * 0.621371192

fahr_to_celc :: Float -> Float
fahr_to_celc fahr = (fahr - 32) * 0.56

{- -------------------- Testing -------------------- -}

main = do
  let res = kmh_to_mach 100 15
  putStrLn (show res)

  let res = mileh_to_mach 100 59
  putStrLn (show res)

  let res = mach_to_kmh 0.08162877 15
  putStrLn (show res)

  let res = mach_to_mileh 0.13134143 59
  putStrLn (show res)
