{{export title="dugi Enlis da dugi bialan"}}
{{let cfile = (r_card ( file "util/dictionary.crd"));
    cards = sort_on $cfile "Name" ;
}}

This dictionary gives examples of how to communicate ideas in the Dugi Bialan. It is not intended to be used strictly. If you feel another phrase or word communicates your intended meaning word, then use that.

<div >
{{for k c in $cards}}
{{if $c.dugi}}<p><b>{{$c.Name}}:</b> {{for kk w in $c.dugi}}&nbsp;-:-&nbsp; {{qoth $w}}{{/for}}</p>{{/if}}
{{/for}}
</div>

