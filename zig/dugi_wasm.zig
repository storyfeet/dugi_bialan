const std = @import("std");
const GPAlloc = std.heap.GeneralPurposeAllocator(.{.safety=false});
const cv = @import("converter.zig");
const fmap = @import("fontmap.zig");


var gpa = GPAlloc{};
var words:?fmap.FontMap = null ;
var letters:?fmap.FontMap = null;

export fn init()void{
    words = fmap.fontMap(gpa.allocator()) catch null;
    letters = fmap.fontMap(gpa.allocator()) catch null;
}

extern "dugi" fn show_dugi(s:[*]const u8,len:u32)void;

export fn convert(s:[*]const u8,len:u32)void {
    var alloc = gpa.allocator();
    var ss = s[0..len];

    var res = std.ArrayList(u8).init(alloc);
    defer res.deinit();
    defer alloc.free(ss);
   

    const wds = words orelse return; 
    const lts = letters orelse return; 

    cv.Converter(std.ArrayList(u8).Writer).convertWith(ss,res.writer(),wds,lts) catch return ;

    show_dugi(res.items.ptr,res.items.len);
    
}

export fn allocUint8(length: u32) [*]const u8 {
    const slice = gpa.allocator().alloc(u8, length) catch
        @panic("failed to allocate memory");
    return slice.ptr;
}

pub fn log(comptime level: std.log.Level, comptime scope: @TypeOf(.EnumLiteral), comptime format: []const u8, args: anytype) void {
    _ = level;
    _ = scope;
    _ = format;
    _ = args;
}

