fn puti(value: i32) void {
    if (value == 0) {
        putc('0');
        return;
    }
    var current_value: i32 = value;
    if (value < 0) {
        putc('-');
        current_value = -value;
    }
    var buffer: [64]u8 = undefined;
    var digit_count: u8 = 0;
    while (current_value != 0) {
        const current_digit = @mod(current_value, 10);
        current_value = @divTrunc((current_value - current_digit), 10);
        const current_char: u8 = @intCast(current_digit + '0');
        buffer[digit_count] = current_char;
        digit_count += 1;
    }

    while (digit_count != 0) : (digit_count -= 1) {
        putc(buffer[digit_count - 1]);
    }
}

fn putc(ch: u8) void {
    // needs be volatile otherwise repeated calls get optimized out
    const ptr: *volatile u8 = @ptrFromInt(0x10000000);
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
    puti(42);
    puts("\r\n");
    puti(-42);
    while (true) {}
}
