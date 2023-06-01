const std = @import("std");
const token = @import("token.zig");
const fmap = @import("fontmap.zig");

const TType = token.TokenType;
const GPAlloc = std.heap.GeneralPurposeAllocator(.{});

pub fn main() !void {

    var gpa = GPAlloc{};
    var alloc = gpa.allocator();

    var stdin = std.io.getStdIn();
    const in_str = try stdin.readToEndAlloc(alloc,100_000);

    const mp = try fmap.fontmap();
    
    defer alloc.free(in_str);

    var stdout = std.io.getStdOut();

    var tk = token.Tokenizer.init(in_str);
    while (try tk.nextToken()) |t| {
	try writeSymbol(stdout.writer(),t,in_str,mp);
    }
}

pub fn writeSymbol(w:anytype,t: token.Token,s:[]const u8,mp:fmap.FontMap)!void{
    switch(t.kind) {
	TType.QUOTE => try w.print("{u}",.{0xe0e6}),
	TType.STOP => try w.print("{u}",.{0xe0e7}),
	TType.COMMA => try w.print("{u}",.{0xe0e8}),
	TType.DASH => {},
	TType.COMMENT => try w.print("{s}",.{s[t.start..t.end]}),
	TType.WORD => {
	    if (mp.get(s[t.start..t.end])) |fp| {
		try w.print("{u}",.{fp.code});
	    }else {
		try w.print("{s}",.{s[t.start..t.end]});
		
	    }
	},
    }
}




