require './TimeRange'

class SubRipFile 
	
	def initialize(subRipFile) 
		@subRipFile = subRipFile
	end

	def shift(milisecondsToShift) 
		File.open(@subRipFile, "r") do |f|
  			f.each_line do |line|
    			
    			if line.include? ":"
    				timeRange = TimeRange.new(line)
    				timeRange.shift(2000)
    				puts timeRange
    			else 
    				puts line
    			end

  			end
		end
	end
	
end



SubRipFile.new("Silicon_Valley_1x04.srt").shift(1000) 

