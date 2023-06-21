const std = @import("std");
const GPAlloc = std.heap.GeneralPurposeAllocator(.{});
const cv = @import("converter.zig");


var gpa = GPAlloc{};


pub fn main() !void {

    var alloc = gpa.allocator();

    var stdin = std.io.getStdIn();
    const in_str = try stdin.readToEndAlloc(alloc,100_000);
    defer alloc.free(in_str);

    try cv.Converter(std.fs.File.Writer).convert(in_str,std.io.getStdOut().writer());
    

}



