package mach

import "testing"

func TestKmhToMach(t *testing.T) {
	got := mach.KmhToMach(100, 15)
	if got != 100 {
		t.Errorf("KmhToMach(100, 15) == %q, want %q", got, 100)
	}
}
