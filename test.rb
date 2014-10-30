class Persona

	def initialize()
		@nombre = 'nombre'
		@apellidos = 'apellidos'
		@fulano = 10
	end

	def pegar
		'hablar del super'
	end


end

class Policia < Persona

	def initialize(nombre, apellidos, porra)
		super()
		@porra = porra
	end

	def pegar 
	 	super() + ' y luego pegar'
	end

end

