{{export title="Dugi Bialan - Grammar"}}
{{@md}}
Grammar
======

Overview
-------

Dugi Bialan is a minimalist language seeking balance between simplicity and minimalism with ease of communication, for both speaker and listener.

It currently has fewer than 200 words, and the majority of meanings can be created by combining these. There may be more words added slowly, and carefully in future. Enough to enable species identification and some difficult concepts, but never more than 240. (Few enough to fit the whole word list and alphabet within a byte)

The language has 5 types of words. 

* Particles (PAR)
* Conjunctions (CON)
* Auxiliary (AUX)
* Prefixes (PRE)
* Atoms (ATOM)

To aid the listener/reader each type of word is only used as 1 of these things, and does not get mixed as others.

The particle types are marked with each word in the [word list](/word_list). Words without a marking are ATOMs

Particles are used to tell the role that whatever follows them takes in the sentence. It no particle is given at the beginning of the sentence, the particle {{qoth "i"}} is assumed, meaning that the first words will be the "subject" of the sentence.

Meaning is built by combining Atoms (and Prefixed Atoms) to describe an idea. Depending on the Particle before it, the idea is considered to be either:

* After : {{qoth "i / ei / lon / gin / da / dan / devin boina"}}
    * A noun followed by a list of adjectives that make it more specific.  {{qoth "elo vedelin"}} "Tool of image" or "pen".
    * A sub-clause
* After : {{qoth "li" }} 
    * An adjective list getting more specific. 
    eg : {{qoth "buna mudei"}} "good many / very good"
    * A number followed by a noun.
    eg : {{qoth "won zan"}} "a person".
* After {{qoth "wei"}} 
    * A verb. eg : {{qoth "giawin moini"}} "going back"

The particle-idea pairs can be put together in any order to make a sentence. Verbs are not necessarily needed. For example :    

{{qoth "mi da vin ei elo vedelin dis"}} or "I to you - pen this"

Is equivalent to : 

{{qoth "ei elo vedelin dis da vin i mi" }} " - pen this TO you SUBJECT I"

Note that in the second sentence, because the subject was not at the beginning, it was prefaced with {{qoth "i"}}. Even though neither sentence has a verb, the meaning is clear.

If a verb is needed, {{qoth "wei"}} is used to mark the simple form. It can be roughly translated as "do".

{{qoth "mi wei bena ei elo da vin"}} or "I DO give - tool TO you"

If instead an adjective is needed {{qoth "li"}} is used, to mark the "being" form. It can be roughly translated as "am/is".

{{qoth "vin li buna"}} or "you ARE good".

Conjunctions (CON) join sentences together into with "if" and "context".

{{qoth "vin li buna esi mi da vin a elo vedelin dis" }} "you ARE good IF I TO you - this pen" 

Note the {{qoth "esi"}}  "A esi B" means "if A then B". This the meaning is "If you are good, I'll give you this pen.

Auxiliaries (AUX) are a small set of special words that can be used in a variety of ways that other words cannot.

Prefixes (PRE) must always have an item after them to complete their meaning. If the same prefix occurs twice, that becomes a complete word, and means roughly the concept it carries. For example {{qoth "ga-una"}} means "colour of mouth" or "red" but {{qoth "ga-ga"}} means "colour"

Sentences can be negated by prefixing the relevant Particle with 'va'

* {{qoth "mi va-li buna"}} "I am not good"
* {{qoth "mi va-wei zon"}} "I don't know"

Yes-no questions are asked by using the "particle not-particle" structure. 

* {{qoth "vin li va-li buna"}} : "you are not-are good?" / "are you good?"
* {{qoth "vin wei va-wei giawin" }} : "you do not-do go?" / "are you going?"
* {{qoth "vin wei giain gin va-gin mi"}} : "you go with not-with me?" / "can I come with you?"

**Any** particle can be turned into a yes-no question like this, though only one per sentence.

Information questions can be asked by replacing the missing information with the word {{qoth "vemi"}} or "what".

* {{qoth "vin da mi wei bena ei vemi"}} "you to me give what?" 
* {{qoth "zan vemi wei dugi"}} "person what do speak" / "who's speaking"


Formal Sentence Structure
--------------

A simple sentence in Dugi Bialan is a list of Particles, each followed by a set of atoms.

__Word : PRE\* (ATOM | PRE\\2)__

A Word is either an Atom, a set of Prefixes followed by an Atom, or a set of prefixes ending in a repeated prefix.

* {{qoth "doimo"}} : Room
* {{qoth "ga-va-zo"}} : Colour of nothing / black
* {{qoth "guli-guli"}} : body

__Item : Word+ ("bi" Complex +)\*__

An Item is a list of words. Latter words act as an adjective/adverb everything before them. {{qoth "bi"}}, acts to create a separation, so that everything after it is treated becomes a single word.

* {{qoth "elein ga-una"}} : clothes red
* {{qoth "elo ema-musi vuli"}} : tool music big - big instrument
* {{qoth "elo bi ema-musi vuli"}} : tool of (music big) - loud instrument
* {{qoth "doimo bi delo guli-guli"}} :  Room of wash body / bathroom
* {{qoth "vo-wuwi eliasi bi wei mugo ei gela mi"}} "the cat that ate my fish"

__Complex : Item | Strict__

A Complex-Item can be either an Item as above, or a whole strict sentence, where every part is marked correctly.

Strict sentences always begin with a particle.

* {{qoth "i vin wei giawin"}}. or "you go"
* {{qoth "wei mugo"}} "do eat"
* {{qoth "da mi ei dis"}} "to me this"

Each of these could follow {{qoth "mi wei belin ei"}} "I want".

* {{qoth "mi wei belin ei elein ga-una"}} "I want red clothes".
* {{qoth "mi wei belin ei i vin wei giawin"}} "I want THAT you go" / "I want you to go"
* {{qoth "mi wei belin ei wei mugo"}} "I want THAT do eat" / "I want to eat"
* {{qoth "mi wei belin ei da mi ei dis"}} "I want THAT to me - this" / "I want this [to come] to me"


__Question : P:(Particle) "va" $P__

A Question is at least one particle then {{qoth "va"}} "not" then the same particles again.

* {{qoth "wei va-wei"}} "do you? / does it?"
* {{qoth "li va-li"}} "are you? / is it?"
* {{qoth "gin va-gin"}} "are you with? / is it with?"

__Phrase : (Marker Complex) | (QuestionMark Complex)__

A Phrase is a marker, followed by the Item it marks together, this can either be a simple concept, or a whole sentence.

* {{qoth "wei giawin"}} : VERB - go
* {{qoth "li belin egi"}} : IS feeling-bad  
* {{qoth "da zan leli"}} : TO person-little : To the child
* {{qoth "lon iasin bi mengi mi"}} ON way of house my : On the way home

__Sentence : Item? Phrase+ | ["mi"] Item? Phrase\*__

A sentence may begin with an unmarked Item, that will be the subject of the sentence.

If a sentence begins with {{qoth "mi"}}, then it can be followed with an item representing a verb

__Strict : Phrase+__

A strict sentence has no implied markers, a subject is marked with {{qoth "i"}}. {{qoth "mi"}} may not be followed directly by a verb.

__Joined : ((Item | Sentence) CON)\* Sentence__

Sentences may be joined with a Conjunction, making the latter sentence dependent on the prior. Items can also be used for establishing contenxt.

* {{qoth "buna esi o bena da mi ei mugo"}} "If good, oh give me good." / "Please give me food"
* {{qoth "gein la mi wei gein mugo"}} "Maybe I can eat"

Primary Particles
---------

Particles are how dugi bialan marks the beginning and end of compound items. They also declare the role of the following item in the sentence.

These are :
* "i" : subject : followed by a noun.    
dropped if sentence starts with subject
* "wei" : do : followed by a verb
* "li" : is : followed by an adjective, or noun.
* "lon" : in/at : followed by a location, or a state of being
* "ei" : direct object : followed by a noun
* "da" : towards/to/for : followed by a noun
* "dan" : because/from : followed by a noun or adjective
* "go" : saying/quote : followed by the quoted clause (use "")
* "o" : Imperetive/Vocative/Polite Call : followed by either a verb or someone to call politely
* "boina" : before : followed by a noun
* "devin" : after : followed by a noun


It is important to note that the same word can be a noun, verb or adjective.

-- {{qoth "mi wei mugo"}}    
.. I eat    
?? I DO food

-- {{qoth "mi li mugo"}}     
.. I am food    

-- {{qoth "mi wei vi ei vi"}}    
.. I set alight a fire

-- {{qoth "mi li vi"}}    
.. I am hot

-- {{qoth "mi li won vi"}}    
.. I am a fire

Particle pairs create Sub-Clauses
--------------

Because a Complex item may be sub-clause, and sub-clauses must always be Strict Sentences that begin with a "Particle", Two particles together will always create a sub clause. 

### da li : to be / in order to be

-- {{qoth "mi wei mugo ei beba da li wiawa"}}    
.. I eat vegetables to become strong    
?? I DO eat OBJECT vegetable TO BE strong

### da wei : to do / in order to

-- {{qoth "zan dis wei mugo da wei guma wiawa"}}    
.. this person eats to become strong    
?? person this DO food TO DO become strong

### dan wei : from doing / because did

-- {{qoth "mi li buna dan wei giawin delo"}}    
.. i like swimming    
?? I AM good FROM DO go water

### gin gin : and with 

-- {{qoth "is-min wei dugi, gin gin luga begi wei ema-egon"}}    
.. She spoke, and,  with her hand, drummed.    

### "li wei" : passive form

Verb that happened to subject

-- {{qoth "mi li wei mugo"}}     
.. I am eaten

### lon wei : In the middle of

-- {{qoth "mi lon wei dugi"}}      
.. I'm in the middle of talking    


Conjuctions
----------

Conjunctions define a relationship between the clause before it, and the clause after.  If the subject is the same, it doesn't need to be indicated on both sides.

* la : while / because / junction / context
* esi : if

-- mi wei giawin la, vin o gein uwein    
.. since I'm going, you can stay

-- mi wei giawin esi, vin o gein uwein    
.. If I go, you can stay.

-- mi wei giawin boina, vin wei gein uwein     
.. before I go, you can stay

-- mi devin giawin , vin wei gein uwein    
.. after i go, you can stay

The first clause can be something as simple as a "dis"

-- dis devin, mi wei giawin    
.. after this I'm going


Vocatives / Imperatives
------------------

The word "o" can be used as both a polite call before a name, to ask for their attention.

-- o [i] zan buna
.. Oh Good person

or as the beginning of a request

-- o [wei] lugin ei dis
.. Oh look at this.

The 'i' and the 'wei' can be dropped, but may be said.

To request an action not happen. use va before the verb marker.

-- o va-wei giawin
.. Oh don't go

Or in more urgent cases, va can come before 'o'. But many people want to be polite before negative.

-- va-o giawin
.. don't go


Yes or No Questions
---------

Yes or no questions, are asked by using the "particle not particle" structure

-- vin li va-li buna dan mi?     
.. do you like me?     
?? you ARE not-ARE good FROM me

To answer "yes", is "li", and "no" is "va-li"

-- vin wei va-wei giawin?    
.. Are you going?    
?? you DO not DO go

"yes in this case is "wei", and "no" is "va-wei"

information questions
----------------

To ask an information question, simply replace the information you with to know with "semi".

If possible put "semi" in the first item of the sentence, though this is not a strict requirement.

-- lon semi?        
.. Where

-- semi wei giawin?    
.. Who is going?

-- dan semi i vin wei zon.    
.. how do you know?

-- wei semi i vin gin elein liawa mi    
.. What are you doing with my hat?    
?? DO what SUB you WITH hat me

-- gin iasin semi wei buli ei bengo    
.. How does one make a car    
?? WITH way what DO make OB vehicle?

Numbers
--------
Build numbers use hyphens to show they are still the same number

Number words are : 
* won : 1
* di : 2
* van : 3
* mo : 4
* lan : 5
* in : 20
* za : 100

A low number before a higher number multiplies it.


1 - 4: won, di, van, mo     
5 - 9 : lan, lan-won, lan-di, lan-van, lan-mo    
10 - 14 : di-lan, di-lan-won, di-lan-di , di-lan-van, di-lan-mo    
15 - 19 : van-lan, van-lan-won, van-lan-di, van-lan-van, van-lan-mo    
20 : in    
25 : in-lan    
30 : in-di-lan    
35 : in-van-lan    
40 : di-in    
45 : di-in-lan    
50 : di-in-di-lan    
55 : di-in-van-lan    
1225 : 2-5-2-100-20-5 (12 hundred and 25) = di-lan-di-za-in-lan    

Auxiliary Particles
---------
Auxiliary particles have a special job to do but their role is unlike any other character and have special rules for each of them.

They are:
* bi : of
* deso : except / but / however
* aini :  or
* egin : also / same

### bi

bi has two main jobs

* Seperate items. 
* Dependent clauses

Normally a noun or adjective is defined as 

A B C -> meaning (A of B) of C

but if we add a 'bi' we get

A bi B C -> A of (B of C)

compare :

zan miani lili - (man of money) of small - the small wealthy money

zan bi miani lili - man of (money of small) - the poor man.

For dependent clauses.

'bi' can be followed by any other particle, and becomes something close to "that"

vo-zuwi **bi wei** moili ei gela mi [la] li luga ei guli-delo lon luga is-vo.

The 'cat', that killed my fish, has blood on it's hands.

### deso - Except/But

Deso can be used like a particle to mean except

-- mi wei mugo muli deso gela    
.. I eat everything except fish

It can be used with negation to mean only or just. the va can apply to the particle or to deso directly

-- mi va-wei deso mugi ei gela
-- mi wei va-deso mugi ei gela    
.. I only eat fish

-- mi wei mugi va-ei deso gela dis
-- mi wei mugo ei va-deso gela dis    
.. I'm eat only this fish

-- me wei bena ei dis va-da deso vin
-- me wei bena ei dis da va-deso vin
.. I give this to only you

### iani - or / choice

### egin - also / same


Prefix Particles
----------------

Prefix Particles do not break the flow of meaning, but are always followed by another word that completes them. Because of this "bi" is not needed. in the romanisation, it is appropriate to hyphenate the join.

these are : 
* edi : taste
* edin : atom 
* ema : Sound
* ga : colour 
* geni : shape 
* guli : body part
* is : pronoun 
* megi : distance
* va : negator
* vo : animal

When joined to themselves, they mean the concept they cover.
* va-va : none
* ga-ga : Colour

When joined to each other the child prefix has its own clarifier

* ga-(vo-ezan) : Wolf-coloured
* ga-(vo-vo) : Animal colour

### The Pronoun "is"

"is" is the general pronoun for anyone or anything in a previous sentence. It is always followed a clarifying word disambiguate. 
The clarifier doesn't have to be first/main word, just the least ambiguous.

#### Simple clarifiers

* is-mudei : they : the group of people
* is-muli : they all 
* is-zan : this/these person(s)
* is-leli : The small one

#### is-zo, The General It*

The general "it", such as "It's raining" "It's dark" "there is" "It is required"

* is-zo : it / the sky / the world / generic it

-- is-zo li ga-va-zo
.. It's dark

#### Possesive instances

"Mine", as opposed to "My thing". Does not need an object specified as conversation already implies that.

* is-mi : mine
* is-vin : Yours
* is-is : his/her/theirs / belonging to the subject

#### Labeled Pronouns

* is-won : Main character
* is-di : Second main character
* is-van : Third main character

These pronouns can be assigned using to following phrase

    <person> is-<number> la

-- zan Elenuna is-won la, li buna    
.. Elenuna, who we shall call is-won is/was good


### "va"

"va" before a particle, says the whole coming particle is false.

-- mi va-wei giawin
.. I'm not going / I don't go

-- dis va-li buna    
.. this is not good

-- mi va-wei zon
.. I don't know

"va" before a verb is equivelant to "un" in english

-- mi wei va-zon     
.. I unknow / I forget

-- va-o va-zon
.. don't forget

* va-va : none
* va-zo : nothing
* va-deso : only
* va-zon : forget

### Colours with "ga"

Describe colours how you like, but these are some good starters.

* ga-ga : colour
* ga-won : uniform colour
* ga-gon : transparent
* ga-va-zo : black 
* ga-va-va : colourless
* ga-esuno : yellow/orange
* ga-delo : blue
* ga-zewi : light-blue
* ga-una : red
* ga-beba : green
* ga-goigo : brown
* ga-mudei : Multicoloured
* ga-muli : White

* ga-dugi : accent

If you wish to say, "all the colours" you can say "ga-ga muli"

### Shapes with geni

As with colours, these are guidelines.

* geni-geni : Shape
* geni-esuno : circle
* geni-din : pointy
* geni-muni : crescent
* geni-lego : Square/rectangle
* geni-belesa : Stick shaped
* geni-belin : Heart shaped 
* geni-ledei : Snowflake shaped
* geni-va-zo : formless
* geni-lugin : eye shaped/oval


### Atoms and molecules with edin

If you want to be precise just use the atomic number

* edin-won : Hydrogen
* edin-di : Helium
* edin-vein : Lithium
* edin-mo : berylium

* edin-duga : Molecule

### Animals with vo

* vo-vo : Animal
* vo-zan : Monkey
* vo-ezan : Wolf/Tiger/fierce animal 
* vo-zon : cunning animal / fox
* vo-beba : Herbivore/farm animal
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

* guli-guli : organ
* guli-zan : body
* guli-zon : brain
* guli-mugo : gut
* guli-delo : kidneys
* guli-gon : lungs
* guli-gein : muscles
* guli-lei : joint

### Tastes with edi
* edi-edi : taste
* edi-gon : smell
* edi-wuwi : Sweet
* edi-giala : Sweet like flower
* edi-vi : Spicy

### Sounds with ema

* ema-ema : Sound
* ema-egon : Crash / drum 
* ema-vo-vo : Animal noise
* ema-musi : Singing
* ema-gon : wind noises

### Measurements with megi

* megi-megi : Measure
* megi-liawa : Height
* megi-vi : Tempurature
* megi-munin : Width
* megi-giawin : Length
* megi-lei : Angle

### Child of with zi

* zi-ma : Child of parent - sibling
* zi-esegi : Child ball - egg
