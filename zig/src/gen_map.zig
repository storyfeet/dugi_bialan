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

    var fontOut = try std.fs.cwd().createFile("gen/words.zig", .{ .truncate = true });
    defer fontOut.close();

    try genFontMap(s, fontOut.writer());

    var humanOut = try std.fs.cwd().createFile("../static/gen/human_dict.md", .{ .truncate = true });
    defer humanOut.close();

    try genHumanDict(s, humanOut.writer());
}

pub fn genFontMap(s: []const u8, fout: anytype) !void {
    const stdout = std.io.getStdOut().writer();

    _ = try fout.write(FMapStart);
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
                            try fout.print("\ttry m.put_{s}(\"{s}\",0x{s});\n", .{ addFn, name, st });
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
    _ = try fout.write(FMapFin);

    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)

}

pub fn genHumanDict(s: []const u8, fout: anytype) !void {
    const stdout = std.io.getStdOut().writer();

    var p = try crd.Parser.init(s, al);
    defer p.deinit();

    while (true) {
        var nx = p.next() catch |e| {
            try stdout.print("Error: {}", .{e});
            return e;
        } orelse return;

        switch (nx) {
            .NAME => |*n| {
                try fout.print("\n{s} - ", .{n.*});
                al.free(n.*);
            },
            .KEYVAL => |*kv| {
                if (std.mem.eql(u8, kv.k, "en")) {
                    try kv.v.printSep(fout, ",");
                }
                if (std.mem.eql(u8, kv.k, "tags")) {
                    try fout.print(" (", .{});
                    try kv.v.printSep(fout, ",");
                    try fout.print(")", .{});
                }
                al.free(kv.k);
                kv.v.deinit(al);
            },
            else => {},
        }
    }
}

const FMapStart =
    \\fn fillMap(m:anytype)!void{
    \\
;

const FMapFin =
    \\}
    \\
;

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
