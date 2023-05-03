from pathlib import Path
import os




if __name__ == "__main__":
    paths = set() 
    for p in Path("glyphs/").glob("*.svg"):
        pre,_ = os.path.splitext(p.name)
        paths.add(pre)

    print(paths)
