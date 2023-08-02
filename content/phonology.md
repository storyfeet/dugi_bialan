{{export title="phonology"}}
{{@md}}

Formalized Phonotactics
-------------

word : (?![a,n,s]) C? (Va F? C)\* Vb F?

loan-word : (?![a,n,s]) C? (Va F? C)\* \[Va,Vb] F? [(C ə)?]

C (Consonant) : [w,d,b,s,l,dz(z),g,n,m,v]

Va (Vowel a) : [ e, oi ,ia, u ]

Vb (Vowel b) : [ ei, o, a , i ]

F (Final) : [n,s]


Phonology
--------

The sound system is designed to be easy to pronounce and destinguish and gentle to listen to.

It deliberately uses the voiced consonants to distinguish itself from Toki Pona, so that people who learn both will be less confused, as the two languages have a lot in common.

Romanization
------------

With the exception of the 'z', the letters are pronounced as in the ipa.
'z' is pronounced as 'dz' in ipa
so 'zan' meaning 'man', is pronounced like the beginning of 'January' in English

glides are indicated by using both the from and to vowels.

Phonotactics
----------

The phonotactics of the language are designed to avoid words being mixed up with combinations of others. 

Every word ends with a vowel from a specific set, maybe followed by one of 2 consonants. These endings cannot appear elsewhere in the word.

This, combined with the fact words cannot start with "a","n",or "s" means that no word can be made as a combination of any two others.

* Words may not start with 'a' 'n' or 's'
* Words may begin with a consonant.
* Starter vowels (Va) are separated by consonants, and maybe 'final's.
* At the end of each word is a final vowel (Vb) 
* This may be followed by a 'final' consonant (F)


Loan Words
--------

Loan words and proper-names are not required to end with a 'Vb', but if they do use one, there can be no 'Va' after it.

They may also end with any consonant, followed by a short 'ə' (shwa). This would be written as a double consonant to mark it

* America - Emeigg (emeigə)
* France - vonss

* England - Einlan

Writing Loan Words
------------

Loan Words are underlined to show they are names, and are read using a phonetic system which is based on words in the logography.

Consonants - Tall
{{@exec_stdin "zig/convert" @ }}
* b#b : biawi
* d#d : dan
* g#g : giasi
* l#l : luga
* m#m : mi
* v#v : vin
* w#w : won
* z#z : zan
{{/exec_stdin}}

Finals - High up. (Finals cannot start a word)
{{@exec_stdin "zig/convert" @ }}
* n#n : enin - short on bottom
* s#s : deso - line down for final
{{/exec_stdin}}

Vowels - Low down
{{@exec_stdin "zig/convert" @ }}
* _e#e : edin    
* _oi#oi : oiga    
* _ia#ia : ziazon
* _u#u : una    
* _ei#ei : wei    
* _o#o : vo    
* _a#a : ga    
* _i#i : i     
{{/exec_stdin}}
