make:
	#riscv64-unknown-elf-as -march=rv64i -mabi=lp64 -o bootstrap.o -c bootstrap.s
	#riscv64-unknown-elf-ld -T qemu.ld -o hello hello.o
	zig build-obj -target riscv64-freestanding -mcpu generic_rv64 --name test main.zig -mcmodel=medium
	#zig build-obj -target riscv64-freestanding -mcpu generic_rv64 --script qemu.ld --name test main.c
	zig build-obj -target riscv64-freestanding -mcpu generic_rv64 --name bootstrap bootstrap.s -mcmodel=medium
	riscv64-unknown-elf-ld -T qemu.ld -o demo test.o bootstrap.o

clean:
	rm -rf *.o
	rm -rf *.elf
	rm -rf *.o.*
	rm demo
run:
	qemu-system-riscv64 -machine virt -bios demo
