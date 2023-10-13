{{export title="enon bi dugi bialan"}}
{{let cfile = (r_card ( file "util/dictionary.crd"));
    cards = sort_on $cfile "Name" ;
}}
<div >
{{for k c in $cards}}
{{if $c.dugi}}<p><b>{{$c.Name}}:</b> {{for kk w in $c.dugi}} - {{$w}}{{/for}}</p>{{/if}}
{{/for}}
</div>

