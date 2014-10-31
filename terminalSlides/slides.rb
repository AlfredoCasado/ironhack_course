require 'terminfo'

class Presentation

	def initialize(user_input: , screen:) 
		@user_input = user_input
		@screen = screen
	end

	def start(slide_reader)

		slides = slide_reader.slides()
		position = 0
		
		while slides.size > position do
			current_slide = slides[position]
			@screen.show(current_slide)

			command = @user_input.read_user_command

			position += 1 if command == 'n' 
			position -= 1 if command == 'p' && position > 0 

		end

		puts "end of presentation"

	end

end

class SlideReaderTestSlides

	def slides
		[
			'metaprograming', 
			'reading properties and methods from a class in runtime', 
			'monkey patching', 
			'open classes', 
			'good luck!'
		]
	end
end

class UserInput

	def read_user_command
		print "(n) next slide, (p) previous slide >> "
		command = gets()
		return command.chomp
	end

end

class Screen 
	
	def show(slide)
		screen_size = TermInfo.screen_size
		files = screen_size[0]
		columns = screen_size[1]

		(1..(files-1)/2).each { puts }
		(1..(columns-slide.size)/2).each {print ' '}
		puts slide
		(1..(files-1)/2).each { puts }
	end

end

Presentation.new(
	user_input: UserInput.new,
	screen: Screen.new
).start(SlideReaderTestSlides.new)


