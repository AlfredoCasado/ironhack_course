
module ToJsonCapability

	def to_json

		object_as_json = "{"
		
		self.instance_variables.each do |instance_variable| 
			value = instance_variable_get(instance_variable)
			object_as_json+="'#{instance_variable[1..-1]}':'#{value}',"
		end

		object_as_json.chop!
		object_as_json += '}'

	end

end

class User
	include ToJsonCapability

	def initialize(name:, age:, ranking: 10)
		@name = name
		@age = age
		@ranking = ranking
	end

end

class BlogPost
	include ToJsonCapability

	def initialize(title:, author:, tags: '')
		@title = title
		@author = author
		@tags = tags
	end
end

user = User.new(name: 'alfredo', age: 36)
puts user.to_json

post = BlogPost.new(
	title: 'la cosa esta muy mala', 
	author: 'montoro', 
	tags: 'politica, humor'
)
puts post.to_json



