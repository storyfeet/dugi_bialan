const std = @import("std");
const token = @import("token.zig");
const fmap = @import("fontmap.zig");

const GPAlloc = std.heap.GeneralPurposeAllocator(.{ .safety = false });
const TType = token.TokenType;
const WType = fmap.WordType;
var gpa = GPAlloc{};

const LOWER_SET = "abdeghilmnosuvwy";

pub fn Converter(comptime tp: type) type {
    return struct {
        words: fmap.FontMap,
        letters: fmap.FontMap,
        s: []const u8,
        w: tp,
        prev: WType,

        ///Does not take ownership of string
        pub fn convert(s: []const u8, w: tp) !void {
            const alloc = gpa.allocator();
            var self = @This(){
                .words = try fmap.fontMap(alloc),
                .letters = try fmap.letterMap(alloc),
                .s = s,
                .w = w,
                .prev = WType.Norm,
            };
            //defer self.free();
            var tk = token.Tokenizer.init(self.s);
            while (try tk.nextToken()) |t| {
                try self.writeSymbol(t);
            }
        }

        pub fn convertWith(s: []const u8, w: tp, words: fmap.FontMap, letters: fmap.FontMap) !void {
            var self = @This(){
                .words = words,
                .letters = letters,
                .s = s,
                .w = w,
                .prev = WType.Norm,
            };
            var tk = token.Tokenizer.init(self.s);
            while (try tk.nextToken()) |t| {
                try self.writeSymbol(t);
            }
        }

        pub fn free(self: @This()) void {
            self.words.clearAndFree();
            self.letters.clearAndFree();
        }

        pub fn writeSymbol(self: *@This(), t: token.Token) !void {
            const w = self.w;
            const s = self.s;
            switch (t.kind) {
                TType.STOP => try self.writeNamedSymbol("_stop", "."),
                TType.COMMA => try self.writeNamedSymbol("_comma", ","),
                TType.DASH => {},
                TType.OPEN_QUOTE => try self.writeNamedSymbol("_open", "-'"),
                TType.CLOSE_QUOTE => try self.writeNamedSymbol("_close", "'-"),
                TType.OPEN_HIGHLIGHT => {
                    try self.writeNamedSymbol("_open", "-'");
                    try w.print("<span class=\"highlight\">", .{});
                },
                TType.CLOSE_HIGHLIGHT => {
                    try w.print("</span>", .{});
                    try self.writeNamedSymbol("_close", "'-");
                },
                TType.NEWLINE => try w.print("\n", .{}),
                TType.COMMENT => try w.print("{s}", .{s[t.start..t.end]}), //todo ignore
                TType.AS_IS => try w.print("{s}", .{s[t.start..t.end]}),
                TType.WORD => {
                    try self.printWord(t);
                },
                TType.LONG_SPACE => try w.print("{s}", .{s[t.start..t.end]}),
            }
        }

        pub fn writeNamedSymbol(self: *@This(), s: []const u8, def: []const u8) !void {
            if (self.letters.get(s)) |lt| {
                try self.w.print("{u}", .{lt.code});
                return;
            }
            try self.w.print("{s}", .{def});
        }

        pub fn printWord(self: *@This(), t: token.Token) !void {
            const wd = self.s[t.start..t.end];
            const w = self.w;

            //Try word in main map

            if (self.words.get(wd)) |fp| {
                if (fp.wType == WType.Par and self.prev == WType.Norm) {
                    try w.print(" ", .{});
                }
                try w.print("{u}", .{fp.code});
                self.prev = fp.wType;
                return;
            }
            try w.print(" ", .{});

            var it = std.unicode.Utf8Iterator{ .bytes = wd, .i = 0 };

            // If word starts with lower case letter, but is not in set we should print it RED
            const first = it.peek(1);
            if (first.len > 0 and std.mem.count(u8, LOWER_SET, first) > 0) {
                try w.print(" <span class=\"err_no_word\">{s}</span> ", .{wd});
                return;
            }

            // Else print it as a name using letter-map  provided
            outer: while (it.peek(1).len > 0) {
                for (0..3) |m| {
                    const n = 3 - m;
                    const pk = it.peek(n);
                    if (self.letters.get(pk)) |bit| {
                        try w.print("{u}", .{bit.code});
                        it.i += pk.len;
                        continue :outer;
                    }
                }
                try w.print("{s}", .{it.nextCodepointSlice() orelse break});
            }
            self.prev = WType.Norm;
        }
    };
}
