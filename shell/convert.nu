def to_pic [] {
	$"<img src=\"glyphs/($in).svg\" />" 
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
	$args | each {open |convert_page }
}


