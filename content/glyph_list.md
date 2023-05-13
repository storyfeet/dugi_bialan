{{export title="Vedelin bi Dugi Bialan"}}
{{let gl = sort (dir"static/glyphs")}}
{{for k v in $gl}}
<div class="glyph-box">
<img src="/glyphs/{{$v}}" /><br>
{{full_stem $v}}
</div>
{{/for}}



