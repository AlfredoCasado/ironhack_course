
def caesar_cypher_inject(clearString) 
	clearString.each_char.inject('') do |cyphedString, originalChar| 
		cyphedString += (originalChar.ord+1).chr
	end
end

def caesar_cypher_each(clearString) 
	cyphedString = ''
	clearString.each_char { |originalChar| cyphedString += (originalChar.ord+1).chr }
	cyphedString
end

puts caesar_cypher_inject("adios")
puts caesar_cypher_each("adios")