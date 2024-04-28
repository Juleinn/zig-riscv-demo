const std = @import("std");

pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{
        .name = "firmware",
        .root_source_file = b.path("src/main.zig"),
        .target = b.resolveTargetQuery(.{ .cpu_arch = .riscv64, .os_tag = .freestanding }),
        // change this to .Debug if needed but will generate a huge binary (1.8MB hello-world).
        // change the RAM region size in qemu.ld accordingly if needed
        .optimize = .ReleaseSmall,
        .code_model = .medium,
    });

    exe.addAssemblyFile(.{ .path = "src/bootstrap.s" });
    exe.setLinkerScript(.{ .path = "src/qemu.ld" });

    b.installArtifact(exe);
}
