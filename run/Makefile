.SUFFIXES: .asm
LIB=simple
CC=gcc -m32 # produce elf32 code in 64-bit machines
CFLAGS=-g -Dunderscore -fno-stack-protector # when __stack_chk_fail in Ubuntu
RUNTIME=lib$(LIB).a # stand-alone runtime
AS=nasm -felf32 # assembler command

all:: $(RUNTIME)

$(RUNTIME): dbl.o linux.o lib.o sys.o
	ar crl $@ $^
.asm.o:
	$(AS) $< -o $@

install:: $(RUNTIME)
	cp $(RUNTIME) ..

clean::
	rm -f $(RUNTIME) *.o a.out core
