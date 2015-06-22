class Board

	attr_reader :grid

	def initialize input_grid = {}
		@grid = input_grid.fetch(:grid, default_grid)
	end

	def get_cell x, y
		grid[y][x]
	end

	def set_value x, y, set_value
		get_cell(x, y).value = value
	end

	private 

	def default_grid
		Array.new(9) { Array.new(9) { Cell.new} }
	end

end