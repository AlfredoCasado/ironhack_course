class Prices

	PRICES = {
		:apple		=>10,
		:orange		=>5,
		:grape		=>15,
		:banana		=>20,
		:watermelon	=>50
	}

	def get_price product
		PRICES[product]
	end

	def all_products
		PRICES.keys
	end
end

class ShopingCart	

	def initialize(disccount)
		@disccount = disccount

		@prices = Prices.new
		@content = {}	
		
		@prices.all_products.each{ |fruit| @content[fruit]=0}
	end

	def add fruit
		@content[fruit]+= 1
	end

	def cost_before_discounts 

		cost = 0

		@content.each do |fruit, number_of_fruits| 
			price = @prices.get_price(fruit)
			cost += price*number_of_fruits
		end

		return cost
	end

	def cost
		cost_before_discounts() - @disccount.applyDiscounts(@content, @prices)
	end

end

class Disccount

	def initialize(disccounts)
		@disccounts = disccounts
	end

	def applyDiscounts(content, prices)
		total = 0

		@disccounts.each do |discount|
			 total-= discount.apply(content,prices)
		end

		return total
	end

end

class DisccountPerVolume

	def initialize(product, number)
		@product = product
		@number = number
	end

	def apply(cart, prices)
		number_of_product = cart[@product]
		(number_of_product / @number) * prices.get_price(@product)
	end
end

cart = ShopingCart.new(
			Disccount.new([
				DisccountPerVolume.new(:apple, 2),
				DisccountPerVolume.new(:orange, 3)
			]))





cart.add :apple
cart.add :apple
puts cart.cost