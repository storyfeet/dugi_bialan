const std = @import("std");
const token = @import("token.zig");
const fmap = @import("fontmap.zig");

const TType = token.TokenType;
const WType = fmap.WordType;
const GPAlloc = std.heap.GeneralPurposeAllocator(.{});

var gpa = GPAlloc{};


fn Converter(comptime tp:type)type{ 
    return struct{
	words: fmap.FontMap,
	letters : fmap.FontMap,
	s : []const u8,
	w : tp,
	prev: WType,

	///Does not take ownership of string
	pub fn convert(s:[]const u8,w:tp) !void{
	    var self = @This() {
		.words = try fmap.fontMap(),
		.letters = try fmap.letterMap(),
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

	pub fn free(self:@This())void {
	    self.words.clearAndFree();
	    self.letters.clearAndFree();
	}

	pub fn writeSymbol(self:*@This(),t: token.Token)!void{
	    const w = self.w;
	    const s = self.s;
	    switch(t.kind) {
		TType.QUOTE => try w.print(" {u}",.{0xe0e6}),
		TType.STOP => try w.print("{u} ",.{0xe0e7}),
		TType.COMMA => try w.print("{u} ",.{0xe0e8}),
		TType.DASH => {},
		TType.NEWLINE => try w.print("\n",.{}),
		TType.COMMENT => try w.print("{s}",.{s[t.start..t.end]}),
		TType.WORD => {
		    try self.printWord(t);
		},
	    }
	}

	pub fn printWord(self:*@This(),t:token.Token) !void{

	    const wd = self.s[t.start..t.end];
	    const w = self.w;
	    if (self.words.get(wd)) |fp| {
		var space = false;
		if (fp.wType == WType.Par and self.prev == WType.Norm ){
		    space = true;
		}
		if (space) {
		    try w.print(" {u}",.{fp.code});
		}else {
		    try w.print("{u}",.{fp.code});
		}
		self.prev = fp.wType;
	    } else {
		try w.print(" ",.{});
		var it = std.unicode.Utf8Iterator{.bytes=wd,.i=0};
		while (it.nextCodepointSlice()) |c|{
		    if (self.letters.get(c)) |fp|{
			try w.print("{u}",.{fp.code});
		    }else {
			try w.print("{s}",.{c});
		    }
		}
		try w.print(" ",.{});
		self.prev = WType.Norm;
		
	    }

	}

    };

}



export fn convert(s:[*]const u8,len:u32)void {
    var alloc = gpa.allocator();
    var ss = s[0..len];

    var res = std.ArrayList(u8).init(alloc);
    Converter(std.ArrayList(u8).Writer).convert(ss,res.writer()) catch return ;
    //return &res.toOwnedSlice();
    
}



pub fn main() !void {

    var alloc = gpa.allocator();

    var stdin = std.io.getStdIn();
    const in_str = try stdin.readToEndAlloc(alloc,100_000);
    defer alloc.free(in_str);

    try Converter(std.fs.File.Writer).convert(in_str,std.io.getStdOut().writer());
    

}



