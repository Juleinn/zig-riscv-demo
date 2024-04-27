fn putc(ch: u8) void {
    const ptr: *u8 = @ptrFromInt(0x10000000);
    ptr.* = ch;
}

fn puts(data: []const u8) void {
    for (data) |chr| {
        putc(chr);
    }
}

export fn main() void {
    puts("Hello, world");
    while (true) {}
}
