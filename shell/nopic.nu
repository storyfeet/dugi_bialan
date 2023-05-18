
def words [] {
	open util/word_list.crd | lines | each {split words} | filter {|n| ($n |length) > 1 } 
}


def nopic [ww] {
	$ww | filter {|w| not ($"static/glyphs/($w.0).svg" | path exists ) }
}

nopic (words) | each {str join " "}
