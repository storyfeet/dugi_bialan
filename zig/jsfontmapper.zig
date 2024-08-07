const std = @import("std");
const fmap = @import("fontmap.zig");

const GPAlloc = std.heap.GeneralPurposeAllocator(.{});
var gpa = GPAlloc{};

pub fn main() !void {
    const alloc = gpa.allocator();
    const stdout = std.io.getStdOut().writer();
    try stdout.print("//generated by zig DO NOT EDIT MANUALLY\n", .{});

    const map = try fmap.fontMap(alloc);
    try writeMap(stdout, map, "fontMap");

    try stdout.print("\n\n", .{});
    const lmap = try fmap.letterMap(alloc);
    try writeMap(stdout, lmap, "letterMap");
}

fn writeMap(w: anytype, map: fmap.FontMap, name: []const u8) !void {
    try w.print("export const {s} = {{", .{name});
    var it = map.iterator();
    var pre: []const u8 = "\n\t";
    while (it.next()) |i| {
        try w.print("{s}\"{s}\":\"\\u{{{x}}}\"", .{
            pre,
            i.key_ptr.*,
            i.value_ptr.code,
        });
        pre = ",\n\t";
    }
    try w.print("\n}};", .{});
}
