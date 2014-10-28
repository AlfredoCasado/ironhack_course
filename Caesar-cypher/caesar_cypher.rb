
def caesar_cypher_inject(clearString, shift=3) 
	clearString.each_char.inject('') do |cyphedString, originalChar| 
		cyphedString += transform_char(originalChar, shift)
	end
end

def transform_char(char, shift) 
	new_char = (char.ord+shift) % 127 
	if new_char < 0 
		new_char = 127 + new_char
	end
	new_char.chr
end

cyphed = caesar_cypher_inject("alfredo",2)
uncyphed = caesar_cypher_inject(cyphed,-2)

puts "cyphed:" + cyphed
puts "uncyphed:" + uncyphed