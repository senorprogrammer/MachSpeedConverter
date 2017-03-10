package mach

import "math"
import "strconv"

const GROUND_AIR_TEMP_C = 15.0
const GROUND_AIR_TEMP_F = 59.0
const KELVIN_TO_CELCIUS = 273.15
const KNOTS_TO_KM = 0.5399568
const THE_MAGIC_CONSTANT = 38.967854

func KmhToMach(km_per_hour float64, outside_air_temp_c float64) float64 {
	return (KNOTS_TO_KM * km_per_hour) / (THE_MAGIC_CONSTANT * math.Sqrt(outside_air_temp_c*KELVIN_TO_CELCIUS))
}

func MilehToMach(miles_per_hour float64, outside_air_temp_f float64) float64 {
	return KmhToMach(mileToKm(miles_per_hour), fahrToCelc(outside_air_temp_f))
}

func MachToKmh(mach float64, outside_air_temp_c float64) float64 {
	return (mach * (THE_MAGIC_CONSTANT * math.Sqrt(outside_air_temp_c+KELVIN_TO_CELCIUS))) / KNOTS_TO_KM
}

func MachToMileh(mach float64, outside_air_temp_f float64) float64 {
	return kmToMiles(MachToKmh(mach, fahrToCelc(outside_air_temp_f)))
}

func F2S(float float64) string {
	return strconv.FormatFloat(float, 'f', 6, 64)
}

// -------------------- Private Functions --------------------

func mileToKm(miles float64) float64 {
	return miles * 1.609344
}

func kmToMiles(km float64) float64 {
	return km * 0.621371192
}

func fahrToCelc(fahr float64) float64 {
	return (fahr - 32.0) * 0.56
}
