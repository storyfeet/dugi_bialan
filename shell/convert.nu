def to_pic [] {
	if ($in == ($in | str capitalize) and (not ($in | str starts-with "_"))) {$in}  else 	{
		$"<img src=\"../glyphs/($in).svg\" class=\"glyph\" />" 
	}
}

def convert_row [] {
	each {to_pic  } | str join " "

}

def space_punct [] {		
	str replace "\"" " _quote " |
	str replace "\\." " _dot " |
	str replace "," " _comma " 

}

def convert_page [] {
	lines | each {space_punct | split row " " | convert_row } | str join "\n" 	
}


def main [...args] {
	$args | each {open |convert_page } | str join " "
}


