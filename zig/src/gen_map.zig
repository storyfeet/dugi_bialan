const std = @import("std");

const crd = @import("card_format");

pub fn main(init: std.process.Init) !void {
    var stdoutob = std.Io.File.stdout().writer(init.io, &.{});
    var stdout = &(stdoutob.interface);

    const cwd = std.Io.Dir.cwd();

    const words = cwd.readFileAlloc(init.io, "../util/word_list.crd", init.gpa, .limited(100_000)) catch |e| {
        try stdout.print("Error opening word_list file {}\n", .{e});
        return e;
    };
    defer init.gpa.free(words);

    const letters = cwd.readFileAlloc(init.io, "../util/letter_list.crd", init.gpa, .limited(10_000)) catch |e| {
        try stdout.print("Error opening letter_list file {}\n", .{e});
        return e;
    };
    defer init.gpa.free(letters);

    var fontOut = try cwd.createFile(init.io, "src/gen/words.zig", .{ .truncate = true });
    defer fontOut.close(init.io);

    var buf: [1000]u8 = undefined;
    var font_writer = fontOut.writer(init.io, &buf);
    _ = try font_writer.interface.write(FMapStart);
    try genUnicodeRows(init.gpa, stdout, words, &font_writer.interface, zigMapRow);
    _ = try font_writer.interface.write(FMapMid);
    try genUnicodeRows(init.gpa, stdout, letters, &font_writer.interface, zigLetterRow);
    _ = try font_writer.interface.write(FMapFin);
    try font_writer.interface.flush();

    var jsFontOut = try cwd.createFile(init.io, "../static/js/jsfontmapper.js", .{ .truncate = true });
    defer jsFontOut.close(init.io);

    var js_font_writer = jsFontOut.writer(init.io, &buf);
    _ = try js_font_writer.interface.write(JMapStart);
    try genUnicodeRows(init.gpa, stdout, words, &js_font_writer.interface, jsMapRow);
    _ = try js_font_writer.interface.write(JMapMid);
    try genUnicodeRows(init.gpa, stdout, letters, &js_font_writer.interface, jsMapRow);
    _ = try js_font_writer.interface.write(JMapFin);
    try js_font_writer.interface.flush();

    var humanOut = try cwd.createFile(init.io, "../static/gen/human_dict.md", .{ .truncate = true });
    defer humanOut.close(init.io);
    var humanWriter = humanOut.writer(init.io, &buf);

    try genHumanDict(init.gpa, stdout, words, &humanWriter.interface);
    try humanWriter.interface.flush();
}

const RowWriter = fn (w: *std.Io.Writer, []const u8, []const u8, []const u8) anyerror!void;

fn zigMapRow(w: *std.Io.Writer, name: []const u8, ucode: []const u8, wtype: []const u8) anyerror!void {
    try w.print("\ttry m.put_{s}(\"{s}\",0x{s});\n", .{ wtype, name, ucode });
}

fn zigLetterRow(w: *std.Io.Writer, name: []const u8, ucode: []const u8, _: []const u8) anyerror!void {
    try w.print("\ttry m.put_pre(\"{s}\",0x{s});\n", .{ name, ucode });
}

fn jsMapRow(w: *std.Io.Writer, name: []const u8, ucode: []const u8, _: []const u8) anyerror!void {
    try w.print("\t\"{s}\":\"\\u{{{s}}}\",\n", .{
        name,
        ucode,
    });
}

pub fn genUnicodeRows(
    al: std.mem.Allocator,
    stdout: *std.Io.Writer,
    s: []const u8,
    fout: *std.Io.Writer,
    rowFn: RowWriter,
) !void {
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

pub fn genHumanDict(al: std.mem.Allocator, stdout: *std.Io.Writer, s: []const u8, fout: *std.Io.Writer) !void {
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
    \\};
    \\
;

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
