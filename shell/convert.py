from pathlib import Path
from enum import Enum
import os

class TokenType(Enum):
    Word = 0
    Comma = 1
    Punct = 2
    NewLine = 3


class Token:
    def __init__(self,k,s,l):
        self.kind = k
        self.string = s
        self.location = l

    def __str__(self):
        return str(self.kind) + ":" + self.string

def tokenize(s):
    pos = 0
    word = ""
    word_pos = 0
    line = 1
    cnum = 1
    def tk(wp):
        (line,cnum,wp)
    for p,c in enumerate(s):
        cnum += 1
        if c.isalpha() :
            if word == "":
                word_pos = p
            word += c
        else :
            if word != "":
                yield Token(TokenType.Word,word,tk(word_pos))
                word = "";
            if c == ' ':
                pass
            elif c == ',':
                yield Token(TokenType.Comma,",",tk(p))
            elif c == '\n':
                yield Token(TokenType.NewLine,"\\n",tk(p))
                line += 1
            else :
                yield Token(TokenType.Punct,c,tk(p))
                


    


def get_glyphs(fname):
    paths = set() 
    for p in Path(fname).glob("*.svg"):
        pre,_ = os.path.splitext(p.name)
        paths.add(pre)
    return paths




if __name__ == "__main__":
    paths = get_glyphs("glyphs/")

    s = open("works/little_red.md").read();
    for t in tokenize(s):
        print (t)

