const std = @import("std");
var AL = std.heap.GeneralPurposeAllocator(.{}){};
var al = AL.allocator();

const crd = @import("card_format");

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

    var p = try crd.Parser.init(s, al);
    defer p.deinit();
    var name: []const u8 = try al.dupe(u8, "NOTHING");

    while (true) {
        var cdata = try p.next() orelse break;

        switch (cdata) {
            .NAME => |cname| {
                al.free(name);
                name = cname;
            },
            .KEYVAL => |*kv| {
                if (std.mem.eql(u8, kv.k, "sign")) {
                    try fout.writer().print("{s}  -  {s}\n", .{ name, kv.v.Str });
                }
                kv.deinit(al);
            },
            else => {
                continue;
            },
        }
    }

    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)

}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
