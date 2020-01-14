EXT=.spl
EXE=../simple
LIB=../libsimple.a

.SUFFIXES: .asm $(EXT)

ALL= div.spl ex2.spl ex3.spl ex4.spl ex5.spl ex6.spl ex.spl fib.spl gcd.spl prio.spl tri.spl x.spl

all::
	for i in $(ALL:%.spl=%); do $(MAKE) $(MFLAGS) $$i; done

run::
	for i in $(ALL:%.spl=%.out); do $(MAKE) $(MFLAGS) $$i; done

$(EXT).o:
	$(EXE) $< $*.asm
	nasm -felf32 $*.asm
	
%: %$(EXT)
	$(EXE) $< $*.asm
	nasm -felf32 $*.asm
	ld -m elf_i386 -o $@ $*.o $(LIB)

clean::
	rm -f *.asm *.o $(ALL:%.spl=%)

div.out: div
	echo 144 | ./div
ex2.out: ex2
	./ex2
ex3.out: ex3
	./ex3
ex4.out: ex4
	./ex4 < ex4.in
ex5.out: ex5
	echo 12 | ./ex5
ex6.out: ex6
	echo 21 | ./ex6
ex.out: ex
	./ex
fib.out: fib
	echo 12 | ./fib
gcd.out: gcd
	./gcd < ./gcd.in
prio.out: prio
	./prio
hello.out: hello
	./hello
printi.out: printi
	./printi
tri.out: tri
	./tri < ./tri.in
x.out: x
	./x
