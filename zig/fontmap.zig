const std = @import("std");


const GPAlloc = std.heap.GeneralPurposeAllocator(.{});
const FontPoint = struct {
    code : u21,
    prefix : bool,
};

fn fp(cd:u21,pre:bool)FontPoint{
    return FontPoint{.code = cd,.prefix = pre};
}

pub fn fontmap() !std.StringHashMap(FontPoint) {
    var gpa = GPAlloc{};
    var alloc = gpa.allocator();
    var map = std.StringHashMap(FontPoint).init(alloc);

    try map.put("ba",fp(0xe132,false));

    /
ba [ah] [exclaim,a] 
egesi [scale,salt] [akesi]
va [not,none,lack] [ala]
eliasi [hunt,search] [alasa]
endei [different] [ante] 
ubei [shame,guilt] [apeja] 
uwein [stand,wait] [awen]
esin [trade,buy,sell] [esin]
zio [thing] [ijo]
egi [bad] [ike]
elio [tool] [ilo]
ensa [inside] [insa]
iagi [yucky,"bad tasting"] [jaki]
zan [person] [jan]
io [have,hold] [jo]
gela [fish] [kala]
guma [come,become,arrive,achieve] [kama]
giasi [tree] [kasi]
giala [flower,bloom] [kasi]
gein [can,able] [ken]
geli [fruit] [kili]
beba [vegetable] [kili]
din [cut, divide] [kipisi]
gion [hard,rock,horn,hit] [kiwen]
zin [metal] [kiwen]
gedin [tooth,bite] [kiwen]
goigo [clay,dirt,earth] [ko]
gon [air,breath] [kon]
gudei [listen,hear,obey] [kute]
leban [hook,take,catch,trap] [lanpan]
liabei [sleep] [lape]
liawa [head,control] [lawa]
lego [brick] [leko]
elein [cloth] [len]
ledei [cold] [lete]
leli [small] [lili]
zi [child,offspring,seed] [lili,sike]
liana [line,cord,string] [linja]
lebo [book,document] [lipu]
luga [hand] [luka]
lugin [look,see,eye] [lukin,oko]
luli [hole,door,entrance] [lupa]
man [place] [ma]
mazuni [old,ancient] [majuno]
ma [parent] [mama]
miani [money,wealth] [mani]
min [female,feminine] [meli] 
memuso [average] [meso,measure]
mon [male] [mije]
miasegegi [medicine] [misikeke]
mugo [food,consume] [moku]
moili [die,death] [moli]
moini [back] [monsi]
liamon [bum,ass] [monsi]
zugo [exit] [monsi,weka]
muni [moon] [mun]
ziavi [play] [musi]
musi [art] [musi]
unio [number] [nanpa]
busi [random,chance] [nasa]
eniasa [mad,wild] [nasa]
iasin [way,path] [nasin]
enin [hill,bump] [nein]
enon [name,word] [nimi]
oiga [foot,base, bottom] [noka]
lin [love] [olin]
begin [start,begin] [open]
ubin [open] [open]
biagela [broken] [pakala]
biage [stop] [pake]
buli [make,do,build] [pali]
belesa [stick,rod] [palisa]
ban [bread,grain] [pan]
bena [give] [pana]
belin [heart,feeling,want,need] [pilin]
beni [finish] [pini]
biog [beside,with] [poka]
bugi [container] [poki]
buna [good,simple] [pona]
lebuni [skilled] [pona]
bialan [balanced] [pona]
buguni ["interact with toki pona"] [pu,ku]
bubumi ["interact with dugi bialan"] [pu,ku]
egin [same,equal] [sama]
zewi [sky,heaven] [sewi]
velo [skin,peal,cover] [selo]
vio [hot,fire] [seli]
vegei [round,ball] [segei]
vis [new,young,again] [sin]
enbin [face,front] [sinpin]
vedelin [writing,drawing,image] [sitelen]
zion [know] [amasona]
ezan [fierce,wolf] [soweli]
vuli [big,much] [suli]
esuno [sun,bright,day] [suno]
munin [over] [supa]
zugi [surface,counter,table] [supa]
viala [cover,lid,door] [supa,nena]
wuwi [sweet] [suwi]
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
