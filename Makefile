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
	@echo OS
	$(call convert,128)

icons/vol_%.png: src/vol_%.svg
	@echo Volume
	$(call convert,32)

icons/func_%.png: src/func_%.svg
	@echo Function
	$(call convert,48)

icons/selection_big.png: src/selection_big.svg
	@echo Selection – Big
	$(call convert,144)

icons/selection_small.png: src/selection_small.svg
	@echo Selection – Small
	$(call convert,64)

icons/mouse.png: src/mouse.svg
	@echo Mouse
	$(call convert,120)

clean:
	rm -f ${PNGS}
