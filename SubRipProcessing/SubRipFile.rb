require './TimeRange'

class SubRipFile 
	
	def initialize(subRipFile, output) 
		@subRipFile = subRipFile
        @output = output
	end

	def shift(milisecondsToShift) 
		File.open(@subRipFile, "r") do |f|
  			f.each_line do |line|
    			process(line,milisecondsToShift)
  			end
		end
	end

    def process(line,milisecondsToShift)
        if isATimeLine(line)
            @output.write(TimeRange.new(line).shift(milisecondsToShift).to_s)
        else 
            @output.write(line)
        end
    end

    def isATimeLine(line) 
        line.include? "-->"
    end
	
end

class OutputConsole
    def write(string)
        puts string
    end
end

class OutputHtml
    def write(string)
        @html = "<p>" + string + "</p>"
    end
end

SubRipFile.new("Silicon_Valley_1x04.srt", OutputConsole.new).shift(1000) 

