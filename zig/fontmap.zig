const std = @import("std");

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

pub fn letterMap(alloc: std.mem.Allocator) !FontMap {
    var map = FontMap.init(alloc);
    try map.put("a", pre(0xe0ee));
    try map.put("e", pre(0xe0ef));
    try map.put("i", pre(0xe0f0));
    try map.put("o", pre(0xe0f1));
    try map.put("u", pre(0xe0f2));
    try map.put("ei", pre(0xe03));
    try map.put("ia", pre(0xe0f4));
    try map.put("oi", pre(0xe0f6));

    try map.put("n", pre(0xe0fe));
    try map.put("s", pre(0xe100));

    try map.put("b", pre(0xe0f9));
    try map.put("d", pre(0xe0fa));
    try map.put("g", pre(0xe0fb));
    try map.put("l", pre(0xe0fc));
    try map.put("m", pre(0xe0fd));
    try map.put("v", pre(0xe102));
    try map.put("w", pre(0xe103));
    try map.put("z", pre(0xe104));

    try map.put("A", pre(0xe0ee));
    try map.put("E", pre(0xe0ef));
    try map.put("I", pre(0xe0f0));
    try map.put("O", pre(0xe0f1));
    try map.put("U", pre(0xe0f2));
    try map.put("Ei", pre(0xe03));
    try map.put("Ia", pre(0xe0f4));
    try map.put("Io", pre(0xe0f5));
    try map.put("Oi", pre(0xe0f6));

    try map.put("N", pre(0xe0fe));
    try map.put("S", pre(0xe100));

    try map.put("B", pre(0xe0f9));
    try map.put("D", pre(0xe0fa));
    try map.put("G", pre(0xe0fb));
    try map.put("L", pre(0xe0fc));
    try map.put("M", pre(0xe0fd));
    try map.put("V", pre(0xe102));
    try map.put("W", pre(0xe103));
    try map.put("Z", pre(0xe104));

    return map;
}

pub fn fontMap(alloc: std.mem.Allocator) !FontMap {
    var map = FontMap.init(alloc);

    // Pefixes

    try map.put("bebi", pre(0xe110));
    try map.put("benon", pre(0xe111));
    try map.put("edi", pre(0xe112));
    try map.put("edin", pre(0xe114));
    try map.put("ema", pre(0xe116));
    try map.put("ga", pre(0xe118));
    try map.put("gan", pre(0xe11a));
    try map.put("gela", pre(0xe11b));
    try map.put("geni", pre(0xe11c));
    try map.put("guli", pre(0xe11e));
    try map.put("is", pre(0xe120));
    try map.put("megi", pre(0xe122));
    try map.put("veso", pre(0xe123));
    try map.put("vo", pre(0xe124));
    try map.put("va", pre(0xe126));
    try map.put("wendo", pre(0xe128));

    // Regular

    try map.put("ba", nm(0xe12c));
    try map.put("ban", nm(0xe12d));
    try map.put("bas", nm(0xe12e));
    try map.put("beba", nm(0xe12f));
    try map.put("begi", nm(0xe130));
    try map.put("begin", nm(0xe131));
    try map.put("belas", nm(0xe132));
    try map.put("belesa", nm(0xe133));
    try map.put("belin", nm(0xe134));
    try map.put("bena", nm(0xe135));
    try map.put("bengo", nm(0xe136));
    try map.put("beni", nm(0xe137));
    try map.put("besa", nm(0xe138));

    try map.put("bi", aux(0xe139));
    try map.put("biagela", nm(0xe13a));
    try map.put("biagei", nm(0xe13b));
    try map.put("bialan", nm(0xe13c));
    try map.put("bianei", aux(0xe13d));
    try map.put("biawi", nm(0xe13f));
    try map.put("bo", nm(0xe140));
    try map.put("beledi", nm(0xe141));
    try map.put("boina", aux(0xe142));
    try map.put("bubiado", nm(0xe143));
    try map.put("bugi", nm(0xe145));
    try map.put("buli", nm(0xe147));
    try map.put("buna", nm(0xe148));
    try map.put("bununei", nm(0xe149));
    try map.put("busi", nm(0xe14a));

    try map.put("da", par(0xe14b));
    try map.put("dan", par(0xe14c));
    try map.put("das", nm(0xe14d));
    try map.put("dedei", nm(0xe14e));
    try map.put("demego", nm(0xe14f));
    try map.put("degis", nm(0xe150));
    try map.put("deli", nm(0xe151));
    try map.put("delo", nm(0xe152));
    try map.put("devo", nm(0xe153));
    try map.put("denso", nm(0xe154));
    try map.put("dei", nm(0xe155));
    try map.put("deni", nm(0xe156));
    try map.put("deso", aux(0xe157));
    try map.put("devin", aux(0xe158));
    try map.put("din", nm(0xe159));
    try map.put("di", nm(0xe15a));
    try map.put("dis", nm(0xe15b));
    try map.put("doimo", nm(0xe15c));
    try map.put("don", nm(0xe15d));
    try map.put("duga", nm(0xe15e));
    try map.put("dugi", nm(0xe15f));

    try map.put("edi", nm(0xe161));
    try map.put("edo", nm(0xe162));
    try map.put("egesa", nm(0xe163));
    try map.put("egesi", nm(0xe164));
    try map.put("egi", nm(0xe165));
    try map.put("egin", nm(0xe166));
    try map.put("egon", nm(0xe167));
    try map.put("ei", par(0xe168));
    try map.put("eleba", nm(0xe169));
    try map.put("elein", nm(0xe16a));
    try map.put("elena", nm(0xe16b));
    try map.put("eliawi", nm(0xe16c));
    try map.put("elo", nm(0xe16d));
    try map.put("enbin", nm(0xe16e));
    try map.put("endei", nm(0xe16f));
    try map.put("eniasa", nm(0xe170));
    try map.put("enin", nm(0xe171));
    try map.put("enma", nm(0xe172));
    try map.put("enon", nm(0xe173));
    try map.put("ensa", nm(0xe174));
    try map.put("esebin", nm(0xe175));
    try map.put("eselin", nm(0xe176));
    try map.put("esenis", nm(0xe177));
    try map.put("esi", con(0xe178));
    try map.put("esin", nm(0xe179));
    try map.put("esuno", nm(0xe17a));
    try map.put("ezan", nm(0xe17b));
    try map.put("esegi", nm(0xe17c));

    try map.put("gedin", nm(0xe17d));
    try map.put("gegon", nm(0xe17e));
    try map.put("gein", nm(0xe17f));
    try map.put("geli", nm(0xe180));
    try map.put("gelin", nm(0xe181));
    try map.put("gelubi", nm(0xe182));
    try map.put("geva", nm(0xe183));
    try map.put("gezuwi", nm(0xe184));
    try map.put("giala", nm(0xe185));
    try map.put("giasi", nm(0xe186));
    try map.put("giawin", nm(0xe187));
    try map.put("gin", nm(0xe188));
    try map.put("go", par(0xe189));
    try map.put("goigo", nm(0xe18a));
    try map.put("gon", nm(0xe18b));
    try map.put("gudei", nm(0xe18c));
    try map.put("guba", nm(0xe18d));
    try map.put("guma", nm(0xe18e));
    try map.put("guvi", nm(0xe18f));

    try map.put("i", par(0xe192));
    try map.put("iagi", nm(0xe193));
    try map.put("iani", nm(0xe194));
    try map.put("iasin", nm(0xe195));
    try map.put("iawi", nm(0xe196));

    try map.put("la", con(0xe199));
    try map.put("lan", nm(0xe19a));
    try map.put("leban", nm(0xe19b));
    try map.put("lebo", nm(0xe19c));
    try map.put("lebuni", nm(0xe19d));
    try map.put("ledei", nm(0xe19e));
    try map.put("lego", nm(0xe19f));
    try map.put("lei", nm(0xe1a0));
    try map.put("lein", nm(0xe1a1));
    try map.put("leli", nm(0xe1a2));
    try map.put("lema", nm(0xe1a3));

    try map.put("lena", nm(0xe1a4));
    try map.put("lesi", nm(0xe1a5));
    try map.put("li", par(0xe1a6));
    try map.put("liabei", nm(0xe1a7));
    try map.put("liamon", nm(0xe1a8));
    try map.put("liasi", nm(0xe1a9));
    try map.put("liawa", nm(0xe1aa));
    try map.put("liazi", nm(0xe1ab));
    try map.put("lin", nm(0xe1ac));
    try map.put("lis", nm(0xe1ad));
    try map.put("loigo", nm(0xe1ae));
    try map.put("lo", par(0xe1af));
    try map.put("lon", par(0xe1b0));

    try map.put("ludi", nm(0xe1b1));
    try map.put("luga", nm(0xe1b2));
    try map.put("lugin", nm(0xe1b3));
    try map.put("luli", nm(0xe1b4));

    try map.put("ma", nm(0xe1b5));
    try map.put("man", nm(0xe1b6));

    try map.put("meda", nm(0xe1b7));

    try map.put("memuso", nm(0xe1b8));
    try map.put("mengi", nm(0xe1b9));
    try map.put("menuga", nm(0xe1ba));
    try map.put("meseni", nm(0xe1bb));
    try map.put("mezan", nm(0xe1bc));
    try map.put("mezuni", nm(0xe1bd));
    try map.put("miani", nm(0xe1be));
    try map.put("miasegegi", nm(0xe1bf));
    try map.put("mi", nm(0xe1c0));
    try map.put("min", nm(0xe1c1));
    try map.put("mo", nm(0xe1c2));
    try map.put("mon", nm(0xe1c3));
    try map.put("moili", nm(0xe1c4));
    try map.put("moini", nm(0xe1c5));
    try map.put("mudei", nm(0xe1c6));
    try map.put("mugi", nm(0xe1c7));
    try map.put("mugo", nm(0xe1c8));
    try map.put("muli", nm(0xe1c9));
    try map.put("muni", nm(0xe1ca));
    try map.put("munin", nm(0xe1cb));
    try map.put("musi", nm(0xe1cc));

    try map.put("o", par(0xe1cd));
    try map.put("oiban", nm(0xe1ce));
    try map.put("oiga", nm(0xe1cf));
    try map.put("oimi", nm(0xe1d0));
    try map.put("oindi", nm(0xe1d1));

    try map.put("uba", nm(0xe1d4));
    try map.put("ubei", nm(0xe1d5));
    try map.put("ubin", nm(0xe1d6));
    try map.put("udiala", nm(0xe1d7));
    try map.put("udon", nm(0x1d8));
    try map.put("uli", nm(0xe1d9));
    try map.put("umeni", nm(0xe1da));

    try map.put("una", nm(0xe1db));
    try map.put("unis", nm(0xe1dc));
    try map.put("uno", nm(0xe1dd));
    try map.put("usis", nm(0xe1de));
    try map.put("ususa", nm(0xe1df));
    try map.put("uwein", nm(0xe1e0));
    try map.put("uwi", nm(0xe1e1));

    try map.put("van", nm(0xe1e3));
    try map.put("vedelin", nm(0xe1e4));
    try map.put("vega", nm(0xe1e5));
    try map.put("vegei", nm(0xe1e6));
    try map.put("veli", nm(0xe1e7));
    try map.put("velo", nm(0xe1e8));
    try map.put("vemi", nm(0xe1e9));
    try map.put("viala", nm(0xe1ea));
    try map.put("vin", nm(0xe1eb));
    try map.put("vi", nm(0xe1ec));
    try map.put("viazo", nm(0xe1ed));

    try map.put("vis", nm(0xe1ee));
    try map.put("vos", nm(0xe1ef));
    try map.put("vuli", nm(0xe1f0));

    try map.put("wega", nm(0xe1f5));
    try map.put("wei", par(0xe1f6));
    try map.put("wi", aux(0xe1f7));
    try map.put("wiasa", nm(0xe1f8));
    try map.put("wiawa", nm(0xe1f9));

    try map.put("won", nm(0xe1fa));
    try map.put("wuwi", nm(0xe1fb));

    try map.put("za", nm(0xe1ff));
    try map.put("zan", nm(0xe200));
    try map.put("zelula", aux(0xe201));
    try map.put("zema", nm(0xe202));
    try map.put("zenan", nm(0xe203));
    try map.put("zeis", nm(0xe204));
    try map.put("zeli", nm(0xe205));
    try map.put("zewi", nm(0xe206));
    try map.put("ziana", nm(0xe207));
    try map.put("zi", nm(0xe208));
    try map.put("zin", nm(0xe209));
    try map.put("ziasi", nm(0xe20a));
    try map.put("ziavi", nm(0xe20b));
    try map.put("ziazon", nm(0xe20c));
    try map.put("zo", nm(0xe20d));
    try map.put("zon", nm(0xe20e));
    try map.put("zugi", nm(0xe20f));
    try map.put("zugo", nm(0xe210));

    return map;
}

const TestErr = error{
    NoValue,
};

test "map can do thing" {
    const mp = try fontMap();
    const pt = mp.get("va") orelse return error.NoValue;
    try std.testing.expect(pt.wType == WordType.Norm);
}
