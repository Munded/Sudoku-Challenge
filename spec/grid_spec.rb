require 'board'

describe Board do

	attr_reader :grid

	grid_3x3 = [['_', '_', '_',], [ '_', '7', '_'], ['_', '_', '_',]]

	it 'has to initialize with a grid' do
	 	expect { Board.new(grid: 'grid') }.not_to raise_error
	end

	it 'initialises with 9 rows by default' do
		board = Board.new
		expect(board.grid.count).to eq 9
	end

	it 'initialises with a 9 slots in each row by default' do
		board = Board.new
		board.grid.each do |row|
			expect(row.count).to eq 9
		end
	end

	it 'can return a cell based on an (x,y) coordinate' do
		board = Board.new grid: grid_3x3
		expect(board.get_cell(1,1)).to eq '7'
	end
end