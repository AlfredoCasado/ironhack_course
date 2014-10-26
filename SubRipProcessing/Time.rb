class Time

	def initialize(time) 
		@hour = time.slice(0,2).to_i
		@minute = time.slice(3,2).to_i
		@second = time.slice(6,2).to_i
		@milisecond = time.slice(9,3).to_i
	end

	def shift(miliseconds) 
		@milisecond+=miliseconds%1000
		
		if (@milisecond > 1000) 
			@milisecond-=1000
			@second+=1
		end

		@second+=miliseconds/1000
	end

	def to_s
		"%02d" % @hour + ":" +
		"%02d" % @minute + ":" +
		"%02d" % @second + "," + 
		"%03d" % @milisecond
	end

end