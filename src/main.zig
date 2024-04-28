fn putc(ch: u8) void {
    const ptr: *u8 = @ptrFromInt(0x10000000);
    ptr.* = ch;
}

fn puts(data: []const u8) void {
    for (data) |chr| {
        putc(chr);
    }
}

fn test_inline() i32 {
    const result: i32 = 0;
    _ = result;

    return asm volatile (
        \\ addi %[result], x0, 42
        : [result] "=r" (-> i32),
    );
}

export fn main() void {
    puts("Hello, world");
    while (true) {}
}
