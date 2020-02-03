LANG=simple
EXT=spl# file extension: .$(EXT)
LIB=lib# compiler library directory
UTIL=util# compiler library: lib$(LIB).a
RUN=run# runtime directory
EXS=exs# examples directory
CC=gcc
CFLAGS=-g -DYYDEBUG
LDLIBS=run/lib$(LANG).a
AS=nasm -felf32
LD=ld -m elf_i386

.SUFFIXES: .asm $(EXT)

$(LANG): gram.y scan.l code.brg
	make -C $(LIB)
	byacc -dv gram.y
	flex -dl scan.l
	pburg -T code.brg
	$(LINK.c) -o $(LANG) $(ARCH) -I$(LIB) lex.yy.c y.tab.c yyselect.c -L$(LIB) -l$(UTIL)
	make -C $(RUN)
	-cp $(RUN)/lib$(LANG).a .

examples:: $(LANG)
	make -C $(EXS)

run:: $(LANG)
	make -C $(EXS) run

%: %.asm
	$(AS) $*.asm
	$(LD) -o $@ $*.o $(LDLIBS)

clean::
	make -C $(LIB) clean
	make -C $(RUN) clean
	make -C $(EXS) clean
	rm -f *.o $(LANG) lib$(LANG).a lex.yy.c y.tab.c y.tab.h y.output yyselect.c *.asm *~
