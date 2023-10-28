{{export title = "Works"}}
{{let works = sort_on (scan_dir "content/works/") "item_file"}}
{{for k w in $works -}}
    {{if (neq $w.item_file "index.md") -}}
    <p><a href="{{join "/works" $w.item_path (stem $w.item_file)}}">{{first $w.title "NO TITLE"}}</a></p>
    {{- /if}}

{{/for}}



