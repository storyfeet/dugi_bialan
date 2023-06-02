{{export title = "Font Print"}}

{{let cfile = (r_card ( file "util/word_list.crd"));
    cards = sort_on $cfile "Name" ;
}}
<div style="max-width:100vw;">
{{@exec_stdin "zig/convert" @ }}
{{for k v in $cards}}{{$v.Name}} {{/for}}
{{/exec_stdin}}
</div>
