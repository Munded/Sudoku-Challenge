require 'board'

describe Board do

	attr_reader :grid

	it 'has to initialize with a grid' do
	 	expect { Board.new(grid: "grid") }.not_to raise_error
	end

	it 'initialises with 9 rows' do
		board = Board.new
		expect(board.grid.count).to eq 9
	end

	it 'initialises with a 9 slots in each row' do
		board = Board.new
		board.grid.each do |row|
			expect(row.count).to eq 9
		end
	end

	# xit 'can place a number' do
	# 	grid = grid.new
	# 	grid.place 1
	# 	expect(grid).to eq []
	# end
end