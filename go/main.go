package main

import (
	"./mach"
)

import "fmt"

func main() {
	fmt.Println(mach.F2S(mach.KmhToMach(100.0, mach.GROUND_AIR_TEMP_C)))
	fmt.Println(mach.F2S(mach.MilehToMach(100.0, mach.GROUND_AIR_TEMP_F)))
	fmt.Println(mach.F2S(mach.MachToKmh(100.0, mach.GROUND_AIR_TEMP_C)))
	fmt.Println(mach.F2S(mach.MachToMileh(100.0, mach.GROUND_AIR_TEMP_F)))
}
