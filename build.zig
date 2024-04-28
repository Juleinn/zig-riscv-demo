const std = @import("std");

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "firmware",
        .root_source_file = b.path("src/main.zig"),
        .target = b.resolveTargetQuery(.{ .cpu_arch = .riscv64, .os_tag = .freestanding }),
        .optimize = optimize,
        .code_model = .medium,
    });

    exe.addAssemblyFile(.{ .path = "src/bootstrap.s" });
    exe.setLinkerScript(.{ .path = "src/qemu.ld" });

    b.installArtifact(exe);
}
