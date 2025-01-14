const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const lib = b.addSharedLibrary("zigretro-core", "src/main.zig", b.version(0, 0, 1));
    lib.setBuildMode(mode);
    lib.addIncludeDir("src/libretro");
    lib.linkLibC();
    lib.install();
}
