# zig - RISC-V
This is a small toy-project for getting familiar with both the RISC-V ISA and zig as an embedded programming language and build environment.

This is meant to run with qemu 

This project is mostly inspired by this blog post : https://popovicu.com/posts/bare-metal-programming-risc-v/

## building


```bash
zig version
0.12.0-dev.3659+1e5075f81

zig build
```

this should give you a RISC-V, doublefloat ABI elf firmware

## running 
Download and install qemu for RISC-V then 

```bash 
qemu-system-riscv64 -machine virt -bios zig-out/bin/firmware
```

Open the serial 0 in qemu, you should get some output information
