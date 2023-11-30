{{export title="enon bi dugi bialan"}}
{{let cfile = (r_card ( file "util/word_list.crd"));
    cards = sort_on $cfile "Name" ;
    glyphs = sort (dir "static/glyphs/" );
}}
<div class="word-list">
{{for k c in $cards}}
<div class="word-box">
<span style="font-weight:bold">{{$c.Name}}</span><br>
{{for kk g in $glyphs}}
    {{if eq $g  (cat $c.Name ".svg")}}<img src="/glyphs/{{$c.Name}}.svg"/> {{/if}}
{{/for}}
<br>
{{for ww w in $c.en}}{{$w}} {{/for}}
{{if $c.tags}}{{for ww w in $c.tags}}{{$w}} {{/for}}{{/if}}
</div>
{{/for}}
</div>

