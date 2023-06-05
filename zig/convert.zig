const std = @import("std");
const token = @import("token.zig");
const fmap = @import("fontmap.zig");

const TType = token.TokenType;
const WType = fmap.WordType;
const GPAlloc = std.heap.GeneralPurposeAllocator(.{});

const Maps = struct{
    words: fmap.FontMap,
    letters : fmap.FontMap,
};

pub fn main() !void {

    var gpa = GPAlloc{};
    var alloc = gpa.allocator();

    var stdin = std.io.getStdIn();
    const in_str = try stdin.readToEndAlloc(alloc,100_000);
    defer alloc.free(in_str);

    const mps = Maps{
	.words = try fmap.fontMap(),
	.letters = try fmap.letterMap(),
    };
    //defer alloc.free(mps.words);
    //defer alloc.free(mps.letters);

    

    var stdout = std.io.getStdOut();

    var tk = token.Tokenizer.init(in_str);
    while (try tk.nextToken()) |t| {
	try writeSymbol(stdout.writer(),t,in_str,mps);
    }
}

pub fn writeSymbol(w:anytype,t: token.Token,s:[]const u8,mps:Maps)!void{
    switch(t.kind) {
	TType.QUOTE => try w.print(" {u}",.{0xe0e6}),
	TType.STOP => try w.print("{u} ",.{0xe0e7}),
	TType.COMMA => try w.print("{u} ",.{0xe0e8}),
	TType.DASH => {},
	TType.NEWLINE => try w.print("\n",.{}),
	TType.COMMENT => try w.print("{s}",.{s[t.start..t.end]}),
	TType.WORD => {
	    const wd = s[t.start..t.end];
	    if (mps.words.get(wd)) |fp| {
		switch (fp.wType) {
		    WType.Con => try w.print("{u} ",.{fp.code}),
		    WType.Par => try w.print(" {u}",.{fp.code}),
		    else => try w.print("{u}",.{fp.code}),
		}
	    }else {
		var it = std.unicode.Utf8Iterator{.bytes=wd,.i=0};
		while (it.nextCodepointSlice()) |c|{
		    if (mps.letters.get(c)) |fp|{
			try w.print("{u}",.{fp.code});
		    }else {
			try w.print("{s}",.{c});
		    }
		}
		try w.print(" ",.{});
		
	    }
	},
    }
}




