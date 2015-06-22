class Cell

	attr_accessor :value

	def initialize params = {}
		@value = params.fetch(:value, '')
	end
end