{{export title="Dugi Bialan - Grammar"}}
{{@md}}
Grammar
======

Overview
-------

Dugi Bialan is a minimalist language seeking balance between simplicity and minimalism with ease of communication, for both speaker and listener.

It currently has close to 200 words, and the majority of meanings can be created by combining these. There will be more words added slowly, and carefully in future. Enough to enable species identification and some difficult concepts, but never more than 240. (Few enough to address the whole word list and alphabet within a byte)

The language has 5 types of words. 

* Particles (PAR)
* Conjunctions (CON)
* Auxiliary (AUX)
* Prefixes (PRE)
* Atoms (ATOM)

To aid the listener/reader, each type of word is only used as one of these things, and cannot be confused with the others.

The particle types are marked with each word in the [word list](/word_list). Words without a marking are ATOMs

Particles are used to mark the role of whatever follows them takes in the sentence. It no particle is given at the beginning of the sentence, the particle {{qoth "ye"}} is assumed, meaning that the first words will be the "subject" of the sentence.

Meaning is built by combining Atoms (and Prefixed Atoms) to describe an idea. Depending on the Particle before it, the idea is considered to be either:

* The Particles {{qoth "ye / ei / lon / gin / da / dan "}} are followed by.
    * A noun phrase
    * A sub-clause
* The Particle {{qoth "li" }} is followed by:
    * An adjective phrase    
    eg : {{qoth "dei buna"}} "much good/ very good"
    * A quantifier and a noun phrase.    
    eg : {{qoth "gi zan"}} "a person".
* The Particle {{qoth "wei"}} is followed by
    * A verb / verb phrase.    
    eg : {{qoth "yawin meni"}} "going back"

The particle-idea pairs can be put together in any order to make a sentence. Verbs are not necessarily needed. For example :    

{{qoth "bei da vin ei elo vedin dis"}} or "I to you - pen this"

Is equivalent to : 

{{qoth "ei elo vedin dis da vin ye bei" }} " - pen this TO you SUBJECT I"

Note that in the second sentence, because the subject was not at the beginning, it was prefaced with {{qoth "ye"}}. Even though neither sentence has a verb, the meaning is clear.

If a verb is needed, {{qoth "wei"}} is used to mark the simple form. It can be roughly translated as "do".

{{qoth "bei wei bena ei elo da vin"}} or "I DO give - tool TO you"

If instead an adjective is needed {{qoth "li"}} is used, to mark the "being" form. It can be roughly translated as "am/is".

{{qoth "vin li buna"}} or "you ARE good".

Conjunctions (CON) join sentences together into with "if" and "context".

{{qoth "vin li buna esi, bei da vin ei elo vedin dis" }} "you ARE good IF I TO you - this pen" 

Note the {{qoth "esi"}}  "A esi B" means "if A then B". So the meaning is "If you are good, I'll give you this pen.

Auxiliaries (AUX) are a small set of special words that can be used in a variety of ways that other words cannot.

Prefixes (PRE) must always have an item after them to complete their meaning. If that item is {{qoth "zo"}} it means the concept that item represents . For example {{qoth "ga-una"}} means "colour of mouth" or "red" but {{qoth "ga-zo"}} means "colour"

Sentences can be negated by prefixing the relevant Particle with 'va'

* {{qoth "bei va-li buna"}} "I am not good"
* {{qoth "bei va-wei zon"}} "I don't know"
* {{qoth "bei va-gin dis mon"}} I'm not with him"

Yes-no questions are asked by using the "particle not-particle" structure. 

* {{qoth "vin li va-li buna"}} : "you are not-are good?" / "are you good?"
* {{qoth "vin wei va-wei yawin" }} : "you do not-do go?" / "are you going?"
* {{qoth "vin wei gein gin va-gin bei"}} : "you go with not-with me?" / "can I come with you?"

**Any** particle can be turned into a yes-no question like this, though only one per sentence.

Information questions can be asked by replacing the missing information with the word {{qoth "vemi"}} or "what".

* {{qoth "vin da bei wei bena ei vemi"}} "you to me give what?" 
* {{qoth "zan vemi wei dugi"}} "person what do speak" / "who's speaking"


Formal Sentence Structure
--------------

A simple sentence in Dugi Bialan is a list of Particles, each followed by a set of atoms.

__Word : PRE\* (ATOM | PRE\\2)__

A Word is either an Atom, or set of Prefixes followed by an Atom.

* {{qoth "dumo"}} : Room
* {{qoth "guli-zo"}} : body
* {{qoth "ga-va-zo"}} : Colour of nothing / black

__Item : Word+ ("bi" Complex +)\*__

An Item is a list of words. Latter words act as an adjective/adverb everything before them. {{qoth "bi"}}, acts to create a separation, so that everything after it is treated becomes a single word.

* {{qoth "elin ga-una"}} : clothes red
* {{qoth "elo ema-musi dei"}} : tool music big - big instrument
* {{qoth "elo bi ema-musi dei"}} : tool of (music big) - loud instrument
* {{qoth "dumo bi delo guli-zo"}} :  Room of wash body / bathroom
* {{qoth "vo-wuwi elesa bi wei mugo ei gela-zo bei"}} "the cat that ate my fish"

__Complex : Item | Strict__

A Complex-Item can be either an Item as above, or a whole strict sentence, where every part is marked correctly.

Strict sentences always begin with a particle.

* {{qoth "ye vin wei yawin"}}. or "you go"
* {{qoth "wei mugo"}} "do eat"
* {{qoth "da bei ei dis"}} "to me this"

Each of these could follow {{qoth "bei wei belin ei"}} "I want".

* {{qoth "bei wei belin ei ye vin wei yawin"}} "I want THAT you go" / "I want you to go"
* {{qoth "bei wei belin ei wei mugo"}} "I want THAT do eat" / "I want to eat"
* {{qoth "bei wei belin ei da bei ei dis"}} "I want THAT to me - this" / "I want this [to come] to me"


__Question : P:(Particle) "va" $P__

A Question is at least one particle then {{qoth "va"}} "not" then the same particles again.

* {{qoth "wei va-wei"}} "do you? / does it?"
* {{qoth "li va-li"}} "are you? / is it?"
* {{qoth "gin va-gin"}} "are you with? / is it with?"

__Phrase : (Marker Complex) | (QuestionMark Complex)__

A Phrase is a marker, followed by the Item it marks together, this can either be a simple concept, or a whole sentence.

* {{qoth "wei yawin"}} : VERB - go
* {{qoth "li belin egi"}} : IS feeling-bad  
* {{qoth "da zan deni"}} : TO person-little : To the child
* {{qoth "lon yasin bi mengi bei"}} ON way of house my : On the way home

__Sentence : Item? Phrase+ | ["bei"] Item? Phrase\*__

A sentence may begin with an unmarked Item, that will be the subject of the sentence.

If a sentence begins with {{qoth "bei"}}, then it can be followed with an item representing a verb

__Strict : Phrase+__

A strict sentence has no implied markers, a subject is marked with {{qoth "ye"}}. {{qoth "bei"}} may not be followed directly by a verb.

__Joined : ((Item | Sentence) CON)\* Sentence__

Sentences may be joined with a Conjunction, making the latter sentence dependent on the prior. Items can also be used for establishing contenxt.

* {{qoth "buna esi o bena da bei ei mugo"}} "If good, oh give me good." / "Please give me food"
* {{qoth "gein la bei wei gein mugo"}} "Maybe I can eat"

Primary Particles
---------

Particles are how dugi bialan marks the beginning and end of compound items. They also declare the role of the following item in the sentence.

These are :
* "ye" : subject : followed by a noun.    
dropped if sentence starts with subject
* "wei" : do : followed by a verb
* "li" : is : followed by an adjective, or noun.
* "lon" : in/at : followed by a location, or a state of being
* "ei" : direct object : followed by a noun
* "da" : towards/to/for : followed by a noun
* "dan" : because/from : followed by a noun or adjective
* "go" : saying/quote : followed by the quoted clause (use "")
* "o" : Imperetive/Vocative/Polite Call : followed by either a verb or someone to call politely


It is important to note that the same word can be a noun, verb or adjective.

-- {{qoth "bei wei mugo"}}    
.. I eat    
?? I DO food

-- {{qoth "bei li mugo"}}     
.. I am food    

-- {{qoth "bei wei vei ei vei"}}    
.. I set alight a fire

-- {{qoth "bei li vei"}}    
.. I am hot

-- {{qoth "bei li gi vei"}}    
.. I am a fire

Particle pairs create Sub-Clauses
--------------

Because a Complex item may be sub-clause, and sub-clauses must always be Strict Sentences that begin with a "Particle", Two particles together will always create a sub clause. 

### da li : to be / in order to be

-- {{qoth "bei wei mugo ei wa-mugo da li yowa"}}    
.. I eat vegetables to become strong    
?? I DO eat OBJECT vegetable TO BE strong

### da wei : to do / in order to

-- {{qoth "zan dis wei buli da wei bena mugo ei zi dis"}}    
.. this person works to feed his children 
?? person this DO work TO DO give food -OB children self 

### dan wei : from doing / because did

-- {{qoth "bei li buna dan wei yawin delo"}}    
.. I like swimming    ?? I AM good FROM DO go water

### gin gin : and with 

-- {{qoth "dis min wei dugi, gin gin luga dis wei ema-egon"}}    
.. She spoke, and,  with her hand, drummed.    

### "li wei" : passive form

Verb that happened to subject

-- {{qoth "bei li wei mugo"}}     
.. I am eaten

### lon wei : In the middle of

-- {{qoth "bei lon wei dugi"}}      
.. I'm in the middle of talking    


Conjuctions
----------

Conjunctions define a relationship between the clause before it, and the clause after.  If the subject is the same, it doesn't need to be indicated on both sides.

* la : while / because / junction / context
* esi : if

-- bei wei yawin la, vin o gein uwein    
.. since I'm going, you can stay

-- bei wei yawin esi, vin o gein uwein    
.. If I go, you can stay.

-- bei li beni yawin la, vin wei gein uwein    
.. after I go, you can stay

The first clause can be something as simple as a "dis"

-- dis la, bei wei yawin    
.. when this happens this I'm going


Vocatives / Imperatives
------------------

The word "o" can be used as both a polite call before a name, to ask for their attention.

-- o [ye] zan buna
.. Oh Good person

or as the beginning of a request

-- o [wei] lugin ei dis
.. Oh look at this.

The 'ye' and the 'wei' can be dropped, but may be said.

To request an action not happen. use va before the verb marker.

-- o va-wei yawin
.. Oh don't go

Or in more urgent cases, va can come before 'o'. But many people want to be polite before negative.

-- va-o yawin
.. don't go


Yes or No Questions
---------

Yes or no questions, are asked by using the "particle not particle" structure

-- vin li va-li buna dan bei?     
.. do you like me?     
?? you ARE not-ARE good FROM me

To answer "yes", is "li", and "no" is "va-li"

-- vin wei va-wei yawin?    
.. Are you going?    
?? you DO not DO go

"yes in this case is "wei", and "no" is "va-wei"

information questions
----------------

To ask an information question, simply replace the information you with to know with "vemi".

If possible put "vemi" in the first item of the sentence, though this is not a strict requirement.

-- lon vemi?        
.. Where

-- vemi wei yawin?    
.. Who is going?

-- dan vemi ye vin wei zon.    
.. how do you know?

-- wei vemi ye vin gin elin liawa bei    
.. What are you doing with my hat?    
?? DO what SUB you WITH hat me

-- gin yasin vemi wei buli ei bengo    
.. How does one make a car    
?? WITH way what DO make OB vehicle?

Numbers
--------

Numbers before another object are cardinal, and dicatate the amount of an object.

> 5 cars : {{ uqoth "lan bengo"}} 

Numbers after an object are ordinal and mark place or position.

> The 5th car : {{uqoth "bengo lan"}}

Number words are : 

>0: {{uqoth "vas"}}    
1: {{uqoth "gi"}}    
2: {{uqoth "di"}}     
3: {{uqoth "van"}}     
4: {{uqoth "mo"}}     
5: {{uqoth "lan"}}     
6: {{uqoth "zeis"}}     
7: {{uqoth "vos"}}     
8: {{uqoth "lis"}}     
9: {{uqoth "lein"}}     

>10: {{uqoth "lo"}}     
1000: {{uqoth "za"}}     

{{uqoth "vas"}} to {{uqoth "lein"}} act as decimal digits, and numbers may be written and spoken in this way.

> 345 : {{qq "van mo lan"}}

However, when writing larger numbers, {{uqoth "lo"}} and {{uqoth "za"}} can be used to mulitply the number before them, and set the place for the next digit.

> 13 : {{qq "lo-van"}} or {{qq "gi-van"}}    
    103: {{qq "lo-lo-vas-van"}}    
    130 : {{qq "lo-lo-van"}}    
    133 : {{qq "lo-lo-van-van"}}    
    303 : {{qq "van-lo-lo-vas van"}}    

{{qq "lo"}} before {{qq "za"}} allows sub 1000 separations at large numbers

> 30,000,000 : {{qq "van lo za za"}}

{{uqoth "gin"}} can be used to separate parts of a number if the number has separate parts

> 3003 : {{qq "van-za gin van"}} or {{ qq "van za vas vas van"}}

{{uqoth "yowa"}}, that is "power" can be used to give very large numbers

> 5 *10 ^ 28 : {{qq "lan lo bi za yowa lein"}}  (that is: 50 of 1000 ^ 9)


Auxiliary Particles
---------
Auxiliary particles have a special job to do but their role is unlike any other character and have special rules for each of them.

They are:
* {{qoth "bi"}} : of
* {{qoth "wi"}} : purpose
* {{qoth "deso"}} : except / but / however
* {{qoth "yani"}} :  or
* {{qoth "egin"}} : also / same

### {{qoth "bi"}} - of

bi has two main jobs

* Seperate items. 
* Dependent clauses

Normally a noun or adjective is defined as 

A B C -> meaning (A of B) of C

but if we add a 'bi' we get

A bi B C -> A of (B of C)

compare :

- {{qoth "zan zega deni"}} - (man of money) of small - the small wealthy man
- {{qoth "zan bi zega deni"}} - man of (money of small) - the poor man.


For dependent clauses.

'bi' can be followed by any other particle, and mean "that" referring to an intrinisic property

- {{qoth "weno-delo bi wei meli"}} : ducks that kill / killer ducks


### {{qoth "wi"}} - purpose

{{q "wi"}} is used to help separate a "cup of water", and a "water cup".

- {{qoth "bugi delo"}} :  Container of Water
- {{qoth "bugi wi delo" }} : Container whose purpose is water

The latter may not have any water in it.

### {{qoth "edo"}} - Which
 
{{q "edo"}} is used for properties not intrinsic to an object.  

{{qoth "vo-wuwi edo wei meli ei gela-zo bei, wei luga ei guli-deli lon luga dis."}}
The 'cat', that killed my fish, has blood on it's hands.

### {{qoth "deso"}} - Except/But

{{q "deso" }} can be used like a particle to mean "except"

{{qoth "bei wei mugo muli deso gela-zo"}}    
-- I eat everything except fish

{{qoth "deso la"}} allows you to begin a sentence with "however".

{{qoth "bei wei yawin da man ziavi, deso la, va-zan lon man dis"}}    
-- I went to the park, however, there was no-one there.

It can be used with negation to mean "nothing but","only" or "just". The va can apply to the particle or to deso directly

-- bei va-wei deso mugo ei gela-zo
-- bei wei va-deso mugo ei gela-zo    
.. I only eat fish

-- bei wei mugo va-ei deso gela-zo dis
-- bei wei mugo ei va-deso gela-zo dis    
.. I eat only this fish

-- bei wei bena ei dis va-da deso vin
-- bei wei bena ei dis da va-deso vin
.. I give this to only you

### {{qoth "yani"}} - or / choice

{{q "yani"}} can be used to separate options

{{qoth "vin wei mugo ei delo ziana, yani delo bi zi wa-mugo"}}    
-- you do consume tea OR coffee?
-- would you like to drink tea OR coffee?

It can be used as a verb to mean "decide".

{{qoth "bei wei yani mugo ei delo ziana"}}    
-- I choose to drink tea

{{qoth "yani la"}} can mean "otherwise".

{{qoth "o vei buna ei delo ziana, yani la, bei va-wei gein mugo"}}    
-- Oh cook well the tea, otherwise I can't drink [it].

### {{qoth "egin"}} - also / same

{{q "egin"}} can mean "also"

{{qoth "bei egin li vei"}}    
-- I too am hot

It can also mean "the same"

{{qoth "bei li egin vin"}}    
-- I'm the same as you

{{qoth "egin la"}} can mean "moreover / again"

{{qoth "bei li belin lebi, egin la, bei li belin mugo"}}
-- I'm tired, moreover, I'm hungry.

Prefix Particles
----------------

Prefix Particles do not break the flow of meaning, but are always followed by another word that completes them. Because of this "bi" is not needed to separate these words from any words before them. In the Romanisation, it is appropriate to hyphenate the join.

these are : 
* {{uqoth "edin"}} : atom 
* {{uqoth "ema"}} : Sound
* {{uqoth "ga"}} : colour 
* {{uqoth "geni"}} : shape 
* {{uqoth "guli"}} : body part
* {{uqoth "megi"}} : distance
* {{uqoth "va"}} : negator
* {{uqoth "vo"}} : animal

When joined to each other the child prefix has its own clarifier

* ga-(vo-ezan) : Wolf-coloured
* ga-(vo-zo) : Animal coloured

### {{uqoth "va"}}

"va" before a particle, says the whole coming particle is false.

-- bei va-wei yawin
.. I'm not going / I don't go

-- dis va-li buna    
.. this is not good

-- bei va-wei zon
.. I don't know

"va" before a verb is equivelant to "un" in english

-- bei wei va-zon     
.. I unknow / I forget

-- va-o va-zon
.. don't forget

* va-zo : none / nothing
* va-deso : only
* va-zon : forget

### Colours with {{uqoth "ga"}}

Describe colours how you like, but these are some good starters.

* ga-zo : colour
* ga-gi : uniform colour
* ga-gon : transparent
* ga-va-zo : black
* ga-esuno : yellow/orange
* ga-delo : blue
* ga-zewi : light-blue
* ga-una : red
* ga-wa-mugo : green
* ga-goigo : brown
* ga-dei : Multicoloured
* ga-muli : White

* ga-dugi : accent

If you wish to say, "all the colours" you can say "ga-zo muli"

### Shapes with geni

As with colours, these are guidelines.

* geni-zo : Shape
* geni-esuno : circle
* geni-din : pointy
* geni-muni : crescent
* geni-lego : Square/rectangle
* geni-belin : Heart shaped 
* geni-ledei : Snowflake shaped
* geni-va-zo : formless
* geni-lugin : eye shaped/oval

### Atoms and molecules with edin

If you want to be precise just use the atomic number

* edin-gi : Hydrogen
* edin-di : Helium
* edin-vein : Lithium
* edin-mo : berylium

* edin-duga : Molecule
* edin-zo : Atom

### Animals with vo

* vo-zo : Animal
* vo-zan : Monkey
* vo-ezan : Wolf/Tiger/fierce animal 
* vo-zon : cunning animal / fox
* vo-wa-mugo : Herbivore/farm animal
* vo-delo : Fish
* vo-wuwi : Cute animal.
* vo-wiasa : Bird
* vo-zewi : High flying bird
* vo-wiasa delo : duck
* vo-egesi : reptile
* vo-goigo : bug / worm
* vo-bubiado : Poisonous / venemous animal
* vo-elena : swarming animal

### Body parts with guli

* guli-zo : body
* guli-zon : brain
* guli-mugo : gut
* guli-delo : kidneys
* guli-gon : lungs
* guli-gein : muscles
* guli-lei : joint

### Plants with wa
* wa-zo : plant
* wa-wuwi : flower
* wa-zi : fruit
* wa-zewi : tall tree
* wa-ususa : Spreading tree
* wa-mugo : vegetalbles
* wa-gedin : thorns
* wa-ewi : stinging plants
* wa-esa : trapping plannts
* wa-lena : vines


### Sounds with ema

* ema-zo : Sound
* ema-egon : Crash / drum 
* ema-vo-vo : Animal noise
* ema-musi : Singing
* ema-gon : wind noises

### Measurements with megi

* megi-zo : Measurement
* megi-liawa : Height
* megi-oiga : Depth
* megi-vei : Tempurature
* megi-munin : Width
* megin enbin : Length
* megi-yawin : Speed
* megi-lei : Angle

Repeated Particles
--------------

The following particles may be repeated to achieve commmunicate that that particles is key.


- {{qoth "bei li buna"}} I am good
- {{qoth "bei li li"}} I AM.

- {{qoth "bei lon man dis"}} I'm at this place
- {{qoth "bei lon lon"}} I'm HERE

- {{qoth "bei wei wei"}} I'm DOING

Pronouns
---------

//TODO

Time
-----

//TODO

Comparisons
--------

//TODO

