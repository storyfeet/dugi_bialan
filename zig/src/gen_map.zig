const std = @import("std");
var AL = std.heap.GeneralPurposeAllocator(.{}){};
var al = AL.allocator();

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var f = std.fs.cwd().openFile("../util/word_list.crd", .{}) catch |e| {
        try stdout.print("Error opening file {}\n", .{e});
        return e;
    };

    defer f.close();

    const s = try f.readToEndAlloc(al, 10_000);

    var fout = try std.fs.cwd().createFile("gen/words.zig", .{ .truncate = true });
    defer fout.close();

    try fout.writeAll(s);
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)

}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
