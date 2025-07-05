const std = @import("std");
var AL = std.heap.GeneralPurposeAllocator(.{}){};
var al = AL.allocator();

const crd = @import("card_format");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var wordf = std.fs.cwd().openFile("../util/word_list.crd", .{}) catch |e| {
        try stdout.print("Error opening file {}\n", .{e});
        return e;
    };
    const words = try wordf.readToEndAlloc(al, 10_000);
    wordf.close();

    var letterf = std.fs.cwd().openFile("../util/letter_list.crd", .{}) catch |e| {
        try stdout.print("Error opening file {}\n", .{e});
        return e;
    };
    const letters = try letterf.readToEndAlloc(al, 10_000);
    wordf.close();

    var fontOut = try std.fs.cwd().createFile("src/gen/words.zig", .{ .truncate = true });
    defer fontOut.close();

    _ = try fontOut.write(FMapStart);
    try genUnicodeRows(words, fontOut.writer(), zigMapRow);
    _ = try fontOut.write(FMapMid);
    try genUnicodeRows(letters, fontOut.writer(), zigLetterRow);
    _ = try fontOut.write(FMapFin);

    var jsFontOut = try std.fs.cwd().createFile("../static/js/jsfontmapper.js", .{ .truncate = true });
    _ = try jsFontOut.write(JMapStart);
    try genUnicodeRows(words, jsFontOut.writer(), jsMapRow);
    _ = try jsFontOut.write(JMapMid);
    try genUnicodeRows(letters, jsFontOut.writer(), jsMapRow);
    _ = try jsFontOut.write(JMapFin);

    var humanOut = try std.fs.cwd().createFile("../static/gen/human_dict.md", .{ .truncate = true });
    defer humanOut.close();

    try genHumanDict(words, humanOut.writer());
}

const RowWriter = fn (anytype, []const u8, []const u8, []const u8) anyerror!void;

fn zigMapRow(w: anytype, name: []const u8, ucode: []const u8, wtype: []const u8) anyerror!void {
    try w.print("\ttry m.put_{s}(\"{s}\",0x{s});\n", .{ wtype, name, ucode });
}

fn zigLetterRow(w: anytype, name: []const u8, ucode: []const u8, _: []const u8) anyerror!void {
    try w.print("\ttry m.put_pre(\"{s}\",0x{s});\n", .{ name, ucode });
}

fn jsMapRow(w: anytype, name: []const u8, ucode: []const u8, _: []const u8) anyerror!void {
    try w.print("\t\"{s}\":\"\\u{{{s}}}\",\n", .{
        name,
        ucode,
    });
}

pub fn genUnicodeRows(
    s: []const u8,
    fout: anytype,
    rowFn: RowWriter,
) !void {
    const stdout = std.io.getStdOut().writer();

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
                if (std.mem.eql(u8, kv.k, "ucode")) { //Requires unicode to be last
                    switch (kv.v) {
                        .Str => |st| {
                            _ = std.fmt.parseInt(u21, st, 16) catch {
                                try stdout.print("Error on {s}: Cannot convert {s} to hex unicode val", .{ name, st });
                                continue;
                            };
                            //try fout.print("\ttry m.put_{s}(\"{s}\",0x{s});\n", .{ addFn, name, st });
                            try rowFn(fout, name, st, addFn);
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
    \\// Generated by zig, do not edit manually
    \\pub fn fillMap(m:anytype)!void{
    \\
;

const FMapMid =
    \\}
    \\
    \\pub fn fillLetters(m:anytype)!void{
    \\
;
const FMapFin =
    \\}
    \\
;

const JMapStart =
    \\// Generated by zig, do not edit manually
    \\export const fontMap = {
    \\
;

const JMapMid =
    \\};
    \\
    \\export const letterMap = {
    \\
;

const JMapFin =
    \\];
    \\
;

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
