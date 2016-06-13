require './mach_speed'

def green(str)
  "\033[32m#{str}\033[0m"
end

def assert(cond)
  print green('.')
	raise unless cond
end

if __FILE__ == $0
  assert(sprintf("%0.4f",  MachSpeedCalculator.kmh_to_mach(100.0, 15)) == "0.0816")
  assert(sprintf("%0.4f",  MachSpeedCalculator.kmh_to_mach(100.0, 45)) == "0.0777")
  assert(sprintf("%0.15f", MachSpeedCalculator.kmh_to_mach(655.7144, 10)) == "0.539956736381214")
  assert(sprintf("%0.4f",  MachSpeedCalculator.kmh_to_mach(200.0, 15)) != "0.09")

  assert(sprintf("%0.4f",  MachSpeedCalculator.mach_to_kmh(0.0816, 15)) == "99.9648")
  assert(sprintf("%0.4f",  MachSpeedCalculator.mach_to_kmh(0.0777, 45)) == "100.0194")
  assert(sprintf("%0.10f", MachSpeedCalculator.mach_to_kmh(1, 10)) == "1214.3832196531")
  assert(sprintf("%0.4f",  MachSpeedCalculator.mach_to_kmh(0.09, 15)) != "200")

  assert(sprintf("%0.4f",  MachSpeedCalculator.mileh_to_mach(100.0, 15)) == "0.1373")
  assert(sprintf("%0.4f",  MachSpeedCalculator.mileh_to_mach(100.0, 45)) == "0.1332")
  assert(sprintf("%0.4f",  MachSpeedCalculator.mileh_to_mach(200.0, 15)) != "0.09")

  assert(sprintf("%0.10f", MachSpeedCalculator.mach_to_mileh(1, 10)) == "724.2314159351")

  puts "\nDone."
end
