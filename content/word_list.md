{{export title="enon bi dugi bialan"}}
{{let cfile = (r_card ( file "util/word_list.crd"));
    cards = sort_on $cfile "Name" ;
    glyphs = sort (dir "static/glyphs/" );
}}
<div class="search">Find : <input id="search_box" type="text"></input></div>
<div class="word-list" id="words_div">
{{for k c in $cards}}
    <div class="word-box">
    <span style="font-weight:bold">{{$c.Name}}</span><br>
    {{for kk g in $glyphs -}}
        {{if eq $g  (cat $c.Name ".svg")}}<img src="/glyphs/{{$c.Name}}.svg"/> {{/if}}
    {{- /for}}
    <br>
    {{for ww w in $c.en}}{{$w}} {{/for}}
    {{if $c.tags}}{{for ww w in $c.tags}}{{$w}} {{/for}}{{/if}}
    </div>
{{/for}}
</div>

<script>
let dom = {
    searchBox : document.getElementById("search_box"),
    wordsDiv : document.getElementById("words_div"),
}

dom.searchBox.oninput = (e) => {
    let ch = dom.wordsDiv.children;
    let tx = dom.searchBox.value;
    for (let c in ch){

        if (ch[c].innerText?.includes(tx)){
            ch[c].classList?.remove("hidden");
        }else {
            ch[c].classList?.add("hidden");
        }
    }
}

</script>
