const std = @import("std");
const token = @import("token.zig");

const GPAlloc = std.heap.GeneralPurposeAllocator(.{});

pub fn main() !void {

    var gpa = GPAlloc{};
    var alloc = gpa.allocator();

    var s_in = std.io.getStdIn();
    const in_str = try s_in.readToEndAlloc(alloc,100_000);
    defer alloc.free(in_str);

	var tk = token.Tokenizer.init(in_str);
	while (try tk.nextToken()) |t| {
		std.debug.print("-{s}-\n",.{in_str[t.start..t.end]});
	}

}


