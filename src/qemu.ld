MEMORY {
  dram_space (rwx) : ORIGIN = 0x80000000, LENGTH = 512k
}

_reset_stack_pointer = ORIGIN(dram_space) + LENGTH(dram_space);

ENTRY(_start);

SECTIONS {
    .text : {
        *(.text.bootstrap);
        *(.text);
        *(.rodata*)
    } > dram_space
}
