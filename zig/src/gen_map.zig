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
    var addFn: []const u8 = "nm";

    while (true) {
        var cdata = p.next() catch {
            try p.printErrs(stdout);
            continue;
        } orelse break;

        switch (cdata) {
            .NAME => |cname| {
                al.free(name);
                name = cname;
                addFn = "nm";
            },
            .KEYVAL => |*kv| {
                if (std.mem.eql(u8, kv.k, "ucode")) {
                    switch (kv.v) {
                        .Str => |st| {
                            _ = std.fmt.parseInt(u21, st, 16) catch {
                                try stdout.print("Error on {s}: Cannot convert {s} to hex unicode val", .{ name, st });
                                continue;
                            };
                            try fout.writer().print("\ttry {s}(\"{s}\",0x{s});\n", .{ addFn, name, st });
                        },
                        else => {
                            try stdout.print("Error on {s}: Cannot read non str as hex unicode val", .{name});
                            continue;
                        },
                    }
                }
                if (std.mem.eql(u8, kv.k, "tags")) {
                    if (kv.v.containsStr("AUX")) addFn = "aux";
                    if (kv.v.containsStr("PRE")) addFn = "pre";
                    if (kv.v.containsStr("PAR")) addFn = "par";
                    if (kv.v.containsStr("CON")) addFn = "con";
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
