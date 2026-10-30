const std = @import("std");
const cv = @import("converter.zig");

pub fn main(init: std.process.Init) !void {
    var inbuf: [2000]u8 = std.mem.zeroes([2000]u8);

    var stdinob = std.Io.File.stdin().reader(init.io, &inbuf);
    var stdin = &stdinob.interface;
    var in_str = std.ArrayList(u8).empty;
    try stdin.appendRemaining(init.gpa, &in_str, .limited(100_000));

    //    const in_str = try stdin.allocRemaining(init.gpa, .limited(100_000));
    defer in_str.deinit(init.gpa);

    var outbuf: [2000]u8 = undefined;
    var stdoutob = std.Io.File.stdout().writer(init.io, &outbuf);
    var stdout = &stdoutob.interface;

    try cv.Converter().convert(init.gpa, in_str.items, stdout);
    try stdout.flush();
}
