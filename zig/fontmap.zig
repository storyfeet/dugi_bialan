const std = @import("std");


const GPAlloc = std.heap.GeneralPurposeAllocator(.{});
const FontPoint = struct {
    code : u21,
    prefix : bool,
};

fn nm(cd:u21)FontPoint{
    return FontPoint{.code = cd,.prefix = false};
}
fn pre(cd:u21)FontPoint{
    return FontPoint{.code = cd,.prefix = true};
}

pub fn fontmap() !std.StringHashMap(FontPoint) {
    var gpa = GPAlloc{};
    var alloc = gpa.allocator();
    var map = std.StringHashMap(FontPoint).init(alloc);

    try map.put("ba",nm(0xe132));
    try map.put("ban",nm(0xe131));
    try map.put("beba",nm(0xe133));
    try map.put("begin",nm(0xe134));
    try map.put("belesa",nm(0xe136));
    try map.put("belin",nm(0xe137));
    try map.put("bena",nm(0xe138));
    try map.put("beni",nm(0xe13a));
    try map.put("biagela",nm(0xe13c));
    try map.put("biagei",nm(0xe13d));
    try map.put("bialan",nm(0xe13e));
    try map.put("biog",nm(0xe140));
    try map.put("bubumi",nm(0xe144));
    try map.put("buguni",nm(0xe146));
    try map.put("buna",nm(0xe148));
    try map.put("bugi",nm(0xe145));
    try map.put("buli",nm(0xe147));
    try map.put("busi",nm(0xe149));

    try map.put("din",nm(0xe15a));

    try map.put("egasi",nm(0xe167));
    try map.put("egi",nm(0xe169));
    try map.put("egin",nm(0xe168));
    try map.put("elein",nm(0xe16b));
    try map.put("eliasi",nm(0xe16d));
    try map.put("elio",nm(0xe16e));
    try map.put("enbin",nm(0xe16f));
    try map.put("endei",nm(0xe175));
    try map.put("eniasa",nm(0xe177));
    try map.put("enin",nm(0xe165));
    try map.put("enon",nm(0xe164));
    try map.put("ensa",nm(0xe176));
    try map.put("esin",nm(0xe171));
    try map.put("esuno",nm(0xe173));
    try map.put("ezan",nm(0xe174));

    try map.put("gedin",nm(0xe17a));
    try map.put("gein",nm(0xe17b));
    try map.put("gela",nm(0xe17c));
    try map.put("geli",nm(0xe17d));
    try map.put("giala",nm(0xe181));
    try map.put("giasi",nm(0xe183));
    try map.put("gion",nm(0xe186));
    try map.put("goigo",nm(0xe187));
    try map.put("gon",nm(0xe188));
    try map.put("gudei",nm(0xe18a));
    try map.put("guma",nm(0xe18b));

    try map.put("iagi",nm(0xe191));
    try map.put("iasin",nm(0xe193));
    try map.put("io",nm(0xe195));

    try map.put("leban",nm(0xe19e));
    try map.put("lebo",nm(0xe19f));
    try map.put("lebuni",nm(0xe1a0));
    try map.put("ledei",nm(0xe1a1));
    try map.put("lego",nm(0xe1a2));
    try map.put("leli",nm(0xe1a4));
    try map.put("lena",nm(0xe1a7));
    try map.put("liabei",nm(0xe1a5));
    try map.put("liamon",nm(0xe1a6));
    try map.put("liawa",nm(0xe1a8));
    try map.put("lin",nm(0xe1a9));
    try map.put("luga",nm(0xe1ad));
    try map.put("lugin",nm(0xe1ae));
    try map.put("luli",nm(0xe1af));

    try map.put("ma",nm(0xe1b5));
    try map.put("man",nm(0xe1b6));
    try map.put("mazuni",nm(0xe1b7));
    try map.put("memuso",nm(0xe1b8));
    try map.put("miani",nm(0xe1ba));
    try map.put("miasegegi",nm(0xe1bb));
    try map.put("min",nm(0xe1bc));
    try map.put("mon",nm(0xe1c0));
    try map.put("moili",nm(0xe1be));
    try map.put("moini",nm(0xe1bf));
    try map.put("mugo",nm(0xe1c4));
    try map.put("muni",nm(0xe1c7));
    try map.put("munin",nm(0xe1c6));
    try map.put("musi",nm(0xe1c8));

    try map.put("oiga",nm(0xe1cf));
    
    try map.put("ubei",nm(0x1d6));
    try map.put("ubin",nm(0x1d7));
    try map.put("unio",nm(0x1db));
    try map.put("uwein",nm(0xe1dc));

    try map.put("va",nm(0xe1e3));
    try map.put("vedelin",nm(0xe1e4));
    try map.put("vegei",nm(0xe1e6));
    try map.put("velo",nm(0xe1e8));
    try map.put("viala",nm(0xe1ea));
    try map.put("vio",nm(0xe1ec));
    try map.put("vis",nm(0xe1ed));
    try map.put("vuli",nm(0xe1ee));

    try map.put("wuwi",nm(0xe1fa));

    try map.put("zan",nm(0xe200));
    try map.put("zewi",nm(0xe203));
    try map.put("zin",nm(0xe208));
    try map.put("zi",nm(0xe20b));
    try map.put("ziavi",nm(0xe206));
    try map.put("zio",nm(0xe20a));
    try map.put("zion",nm(0xe209));
    try map.put("zugi",nm(0xe1c6));
    try map.put("zugo",nm(0xe20d));

bubiado [poison,bitter] []
giawin [leg,go] [tawa]
delo [water] [telo]
deli [oil] [deli]
don [time,hour] [tenpo]
dugi [talk,speak,communicate] [toki]
lei [joint, bend,corner] []
duga [fuse,alloy,stick,weld] []


mengi [building,build] [tomo,pali]
doimo [room,area,reside] [tomo,ma]
bengo [vehicle] [tomo,tawa]
denso ["non binary"] [tonsi]
una [mouth] [uta]
udiala [fight] [utala]
uli [compete] [utala]
giali [excercise] [utala]
wiasa [wing] [waso]
wiawa [mighty,strong] [wawa]
biawi [electric] [wawa]
wega [yeet,away,gone] [weka]

enma [being,soul,spirit] [zan,sijelo]
esebin [think] [isipin]
ziana [flat,sheet,paper,leaf] [supa,lipu]
degis [right,side] [teje]
esenis [left,side] [soto]


benon ["the word"] [PRE,quote]
edi [taste] [namako,PRE]
edin [atom,molecule] [PRE]
ema [sound] [PRE,kalam,kalamaa]
ga [colour] [PRE,kule]
geni [shape] [PRE]
guli [core,gut,organ,"body part"] [sijelo,pilin,insa,PRE]
is [they] [pronoun, ona,PRE]
vo [animal] [soweli,PRE]
gan [direction] [tawa,PRE]


i [subject] [PAR,en]
ei [object] [PAR,e]
li [is,be,adjective] [PAR,li]
da [for,"in order to"] [PAR,tawa]
dan [from,because] [PAR,tan]
gin [with,using,also,"and-PAR"] [PAR,kin]
lon [at,in] [PAR,lon]
wei [do,verb] [PAR,li]
o [imperetive] [PAR,o]
boina [before] [PAR,tenpo,lili,pini]
devin [after,then] [PAR,tenpo,suli,kama]
go [quote] [PAR,quote]

esi [if] [CON,la]
la [then,context] [CON,la]

vemi [what] [question,seme]
mugi [unknown,some] [question,seme]
gelubi [group,meeting] [kulupu]
geluba [connection] [kulupu]
elena [dust,sand] []
geva [partner,spouse] [kulupu,kin]


iani [or] [question,anu,AUX]
deso [but, however, except] [taso,AUX]
bi [of] [AUX,pi]

# Pronouns
mi [me,i,my] [pronoun,mi]
vin [you,your] [pronoun,sina]

dis [this] [pronoun,ni]
das [that] [pronoun,ni]
bagi [self] [pronoun,ona,mi,sina]

vega [species,type] [kule]

# Amounts / numbers

won [one] [wan,number]
di [two] [tu,number]
van [three] [san,"tu wan",number]
mo [four] [po,number]
lan [five] [luka,number]
in [twenty] [mute,number]
za [hundred] [mute,ali,number]

mudei [several,increase] [mute,amount]
zelula [shitloads,too,much,many] [mute,amount]
muli [all,every] [ali,ale,amount]
egesa [exact,point] [ni]
loigo [lock,tie,know,tight] []
veli [real,true] [lon]



#measurable
ziasi [reflect,opposite] [amount,ante]

megi [distance] [measure,weka]
ziazi [mass] [measure,suli]
debiawi [current,electricity] [measure,suno]
oiban [frequency] [measure]

belas [full] [suli,measure]
biaga [speed,fast] [tenpo,lili]









    return map;
}

const TestErr = error{
    NoValue,
};

test "map can do thing"{
    const mp = try fontmap();
    const pt = mp.get("word") orelse return error.NoValue;
    try std.testing.expect(pt.prefix == false);
}
