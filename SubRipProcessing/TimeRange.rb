require './Time.rb'

class TimeRange

	def initialize(line) 
		@start = Time.new(line.split(" --> ")[0])
		@end = Time.new(line.split(" --> ")[1])
	end

	def shift(miliseconds) 
		@start.shift(miliseconds)
		@end.shift(miliseconds)
	end

	def to_s
		@start.to_s + " --> " + @end.to_s
	end

end

