const std = @import("std");
const words = @import("./gen/words.zig");

//NOTE IF NUMBERS CHANGE fix in content/math.html

pub const WordType = enum {
    Par,
    Con,
    Aux,
    Pre,
    Norm,
};

const GPAlloc = std.heap.GeneralPurposeAllocator(.{});
const FontPoint = struct {
    code: u21,
    wType: WordType,
};

pub const FontMap = std.StringHashMap(FontPoint);

fn nm(cd: u21) FontPoint {
    return FontPoint{ .code = cd, .wType = WordType.Norm };
}

fn pre(cd: u21) FontPoint {
    return FontPoint{ .code = cd, .wType = WordType.Pre };
}

fn aux(cd: u21) FontPoint {
    return FontPoint{ .code = cd, .wType = WordType.Aux };
}
fn par(cd: u21) FontPoint {
    return FontPoint{ .code = cd, .wType = WordType.Par };
}
fn con(cd: u21) FontPoint {
    return FontPoint{ .code = cd, .wType = WordType.Con };
}

const MapPutter = struct {
    fmap: *FontMap,

    pub fn put_nm(self: @This(), key: []const u8, val: u21) !void {
        try self.fmap.put(key, nm(val));
    }
    pub fn put_pre(self: @This(), key: []const u8, val: u21) !void {
        try self.fmap.put(key, pre(val));
    }
    pub fn put_aux(self: @This(), key: []const u8, val: u21) !void {
        try self.fmap.put(key, aux(val));
    }
    pub fn put_par(self: @This(), key: []const u8, val: u21) !void {
        try self.fmap.put(key, par(val));
    }
    pub fn put_con(self: @This(), key: []const u8, val: u21) !void {
        try self.fmap.put(key, con(val));
    }
};

pub fn letterMap(alloc: std.mem.Allocator) !FontMap {
    var res = FontMap.init(alloc);
    const putter = MapPutter{ .fmap = &res };
    try words.fillLetters(putter);
    return res;
}

pub fn fontMap(alloc: std.mem.Allocator) !FontMap {
    var res = FontMap.init(alloc);
    const putter = MapPutter{ .fmap = &res };
    try words.fillMap(putter);
    return res;
}

const TestErr = error{
    NoValue,
};

test "map can do thing" {
    const mp = try fontMap();
    const pt = mp.get("va") orelse return error.NoValue;
    try std.testing.expect(pt.wType == WordType.Norm);
}
