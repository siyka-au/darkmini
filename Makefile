# Usage:
# make		Build entire theme
# make icons	Generator PNG icons

.DEFAULT_GOAL := build
.PHONE := all clean

SVGS := $(wildcard src/*.svg)
PNGS := $(SVGS:src/%.svg=icons/%.png)

define convert
	rsvg-convert --format=png --background-color=None --width=$(1) --height=$(1) --output $@ $^
endef

build: ${PNGS}

icons/os_%.png: src/os_%.svg
	$(call convert,256)

icons/vol_%.png: src/vol_%.svg
	$(call convert,64)

icons/func_%.png: src/func_%.svg
	$(call convert,96)

icons/selection_big.png: src/selection_big.svg
	$(call convert,288)

icons/selection_small.png: src/selection_small.svg
	$(call convert,128)

icons/mouse.png: src/mouse.svg
	$(call convert,240)

clean:
	rm -f ${PNGS}
