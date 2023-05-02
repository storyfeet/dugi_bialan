
def words [] {
	open word_list.crd | lines | each {|it| split words} | each {select 0} | flatten
}

words
