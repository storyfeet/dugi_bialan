{{export title="dugi Enlis da dugi bialan"}}
{{let cfile = (r_card ( file "util/dictionary.crd"));
    cards = sort_on $cfile "Name" ;
}}

This dictionary gives examples of how to communicate ideas in the Dugi Bialan. It is not intended to be used strictly. If you feel another phrase or word communicates your intended meaning word, then use that.

<div class="search">Find : <input id="search_box" type="text"></input></div>
<div id="words_div">
{{for k c in $cards}}
{{if $c.dugi}}<p><b>{{$c.Name}}:</b> {{for kk w in $c.dugi}}&nbsp;-:-&nbsp; {{dict $w}}{{/for}}</p>{{/if}}
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
