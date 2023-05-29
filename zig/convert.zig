const std = @import("std");

const GPAlloc = std.heap.GeneralPurposeAllocator(.{});

pub fn main() !void {

    var gpa = GPAlloc{};
    var alloc = gpa.allocator();

    var s_in = std.io.getStdIn();
	const in_str = try s_in.readToEndAlloc(alloc,100_000);
	defer alloc.free(in_str);

	std.debug.print("Hello",.{});
	std.debug.print("{s}",.{in_str});
}
