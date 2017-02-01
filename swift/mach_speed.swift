#!/usr/bin/env swift

import Darwin
import Foundation

class MachSpeedCalculator {
    let groundAirTemp_c  = 15.0
    let groundAirTemp_f  = 59.0
    let kelvinToCelcius  = 273.15
    let knotsToKm        = 0.5399568
    let theMagicConstant = 38.967854

    func kmh_to_mach(km_per_hour: Double, outside_air_temp_c: Double) -> Double {
        return (knotsToKm * km_per_hour) / (theMagicConstant * sqrt(outside_air_temp_c + kelvinToCelcius))
    }

    func mileh_to_mach(miles_per_hour: Double, outside_air_temp_f: Double) -> Double {
        let kmh = mile_to_km(miles: miles_per_hour)
        let cel = fahr_to_celc(fahr: outside_air_temp_f)

        return kmh_to_mach(km_per_hour: kmh, outside_air_temp_c: cel)
    }

    func mach_to_kmh(mach: Double, outside_air_temp_c: Double) -> Double {
        return (mach * (theMagicConstant * sqrt(outside_air_temp_c + kelvinToCelcius))) / knotsToKm
    }

    func mach_to_mileh(mach: Double, outside_air_temp_f: Double) -> Double {
        let cel = fahr_to_celc(fahr: outside_air_temp_f)
        let kmh = mach_to_kmh(mach: mach , outside_air_temp_c: cel)

        return km_to_mile(km: kmh)
    }

    /* -------------------- Private Methods -------------------- */

    func mile_to_km(miles: Double) -> Double {
        return miles * 1.609344
    }

    func km_to_mile(km: Double) -> Double {
        return km * 0.621371192
    }

    func fahr_to_celc(fahr: Double) -> Double {
        return (fahr - 32) * 0.56
    }
}

/* -------------------- Main -------------------- */

// I don't know how to do unit testing with Swift from the console
var calc = MachSpeedCalculator.init()

print(NSString(format: "%.4f", calc.kmh_to_mach(km_per_hour: 100, outside_air_temp_c: 15))      == "0.0816")
print(NSString(format: "%.4f", calc.mileh_to_mach(miles_per_hour: 100, outside_air_temp_f: 59))    == "0.1313")
print(NSString(format: "%.4f", calc.mach_to_kmh(mach: 0.8168, outside_air_temp_c: 15))   == "1000.6277")
print(NSString(format: "%.4f", calc.mach_to_mileh(mach: 0.1314, outside_air_temp_f: 59)) == "100.0446")
