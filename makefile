DIST=EFI/OC/ACPI
IASL=./iasl6

.hansyao: debug
debug:
	@$(IASL) -tc SSDT-Dell-M4800.dsl
	@if [ -e ./$(DIST) ]; then rm -f ./$(DIST); fi
	@mkdir ./$(DIST)
	# @mv SSDT-Dell-M4800.aml ./$(DIST)/
	# @rm -f SSDT-Dell-M4800.hex


.hansyao: all
all:
	@$(IASL) -tc SSDT-Dell-M4800.dsl
	@if [ -e ./$(DIST) ]; then rm -r ./$(DIST); fi
	@mkdir ./$(DIST)
	@mv SSDT-Dell-M4800.aml ./$(DIST)/
	@rm -f SSDT-Dell-M4800.hex

.hansyao: clean
clean:
	@if [ -e ./$(DIST) ]; then rm -r ./$(DIST); fi
	@echo "clean finish"

.hansyao: esp
esp:
	sudo diskutil mount -mountpoint ./ESP $(diskutil list | grep EFI | awk -F' ' '{print $NF}') 



