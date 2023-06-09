#! /usr/bin/env python
from pathlib import Path
from enum import Enum
import os
import sys

class TokenType(Enum):
    Word = 0
    Comma = 1
    Punct = 2
    NewLine = 3
    Comment = 4

class ReadState(Enum):
    Ready = 0
    Secondary = 1


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
    comment = False 
    def tk(wp):
        (line,cnum,wp)
    for p,c in enumerate(s):
        cnum += 1
        if comment :
            if word == "":
                word_pos = p
            if c == '#' or c == '\n' :
                yield Token(TokenType.Comment,word,tk(word_pos))
                comment = False
                word = ""
            else :
                word += c


        elif c.isalpha() :
            if word == "":
                word_pos = p
            word += c
        else :
            if word != "":
                yield Token(TokenType.Word,word,tk(word_pos))
                word = "";
            if c == ' ':
                pass
            elif c == '#':
                comment = True
                word == ""
            elif c == ',':
                yield Token(TokenType.Comma,",",tk(p))
            elif c == '\n':
                yield Token(TokenType.NewLine,"\\n",tk(p))
                line += 1
            else :
                yield Token(TokenType.Punct,c,tk(p))
    
    if word != "":
        yield Token(TokenType.Word,word,tk(word_pos))



    


def get_glyphs(fname):
    paths = set() 
    for p in Path(fname).glob("*.svg"):
        pre,_ = os.path.splitext(p.name)
        paths.add(pre)
    return paths


def try_pic(s,paths,cname="g-base"):
    if s in paths:
        print('<img src="/glyphs/{}.svg" title="{}" class="{}"/>'.format(s,s,cname),end="")
    else:
        print(' {} '.format(s),end="")


def is_prefix(token):
    return token.string in {"megi","ga","gan","geni","is","vo","edin","edi","guli","ema"}
         



if __name__ == "__main__":
    paths = get_glyphs("static/glyphs/")
    
    
    readstate = ReadState.Ready
    s = sys.stdin.read();
    #print("s = \"{}\"".format(s))
    for t in tokenize(s):
        if t.kind == TokenType.Word :
            if readstate == ReadState.Ready:
                if is_prefix(t):
                    try_pic(t.string,paths,"g-second")
                    readstate = ReadState.Secondary
                else :
                    try_pic(t.string,paths)
            else :
                cc = "g-s-follow" if is_prefix(t) else "g-follow" 
                try_pic(t.string,paths,cname=cc)
                readstate = ReadState.Ready
        elif t.kind == TokenType.NewLine :
            print ("<br>")
        elif t.string == "-":
            if readstate == ReadState.Ready:
                print(t.string)
        elif t.string == "\"":
            try_pic("_quote",paths)
        elif t.string == ".":
            try_pic("_stop",paths)
        elif t.string == ",":
            try_pic("_comma",paths)
            
        elif t.kind == TokenType.Comment:
            print(t.string)
            print("<br>")
        else :
            print(t.string)


