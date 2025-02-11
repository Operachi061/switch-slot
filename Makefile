build:
	nimble build -d:release
	@echo "Building finished!"
	@echo "If you want install the program, try 'make install' as root"

.PHONY = clean, install

clean:
	rm switch_slot

install:
	install -m755 switch_slot /usr/bin/switch_slot
	install -m755 res/switch_slot-run /usr/bin/switch_slot-run
	install -m644 res/switch-slot.desktop /usr/share/applications/switch-slot.desktop
