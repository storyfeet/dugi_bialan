{{export type="nothing";
    ext="js"-}}
{{let cfile = (r_card ( file "util/word_list.crd"));
    cards = sort_on $cfile "Name" ;
    glyphs = sort (dir "static/glyphs/" );
-}}
let items = {{w_json $cards}};
export {items};

