ARCH = arm-none-eabi-
LD = $(ARCH)ld
CC = $(ARCH)gcc
STRIP = $(ARCH)strip
CFLAGS = -D__NO_SYSTEM_INIT

# linker script must be first dependency
minimal: efm32gg.ld startup_efm32gg.o main.o
	$(LD) -n -o $@ -T $^
#	$(STRIP) -s $@

%.o: %.S
	$(CC) $(CFLAGS) -c -o $@ $^


.PHONY: clean
clean:
	rm -f minimal startup_efm32gg.o main.o
