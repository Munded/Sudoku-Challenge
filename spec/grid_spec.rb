require 'board'

describe Board do

	attr_reader :grid

	grid_3x3 = [['_', '_', '_',], [ '_', 7, '_'], [ '_', '_', '_',]]


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
		expect(board.get_cell(1,1)).to eq 7
	end

	context 'placing numbers' do
		it 'can set the value of a cell by (x,y) coordinate' do
			Cell = Struct.new(:value)
			mocked_grid = [[Cell.new('_'), Cell.new('_'), Cell.new('_'),], [ Cell.new('_'), Cell.new(7), Cell.new('_')], [ Cell.new('_'), Cell.new('_'), Cell.new('_'),]]
			board = Board.new grid: mocked_grid
			board.set_value 0, 2, 6
			expect(board.get_cell(0, 2).value).to eq 6
		end

		it 'cannot place an invalid number' do
			Cell = Struct.new(:value)
			mocked_grid = [[Cell.new('_'), Cell.new('_'), Cell.new('_'),], [ Cell.new('_'), Cell.new(7), Cell.new('_')], [ Cell.new('_'), Cell.new('_'), Cell.new('_'),]]
			board = Board.new grid: mocked_grid
			expect { board.set_value 0, 2, 0 }.to raise_error('Not Valid Placement')
			expect(board.get_cell(0, 2).value).to eq '_'
		end

		it 'cannot place the same number in the same row' do
			Cell = Struct.new(:value)
			mocked_grid = [[Cell.new('_'), Cell.new('_'), Cell.new('_'),], [ Cell.new('_'), Cell.new(7), Cell.new('_')], [ Cell.new('_'), Cell.new('_'), Cell.new('_'),]]
			board = Board.new grid: mocked_grid
			expect { board.set_value 0, 1, 7 }.to raise_error('Not Valid Placement')
		end

		it 'cannot place the same number in the same column' do
			Cell = Struct.new(:value)
			mocked_grid = [[Cell.new('_'), Cell.new('_'), Cell.new('_'),], [ Cell.new('_'), Cell.new(7), Cell.new('_')], [ Cell.new('_'), Cell.new('_'), Cell.new('_'),]]
			board = Board.new grid: mocked_grid
			expect { board.set_value 1, 0, 7 }.to raise_error('Not Valid Placement')
		end

		# it 'cannot place the same number in the same 3x3 grid' do
		# 	Cell = Struct.new(:value)
		# 	mocked_grid = [[Cell.new('_'), '_', '_',], [ '_', 7, '_'], [ '_', '_', '_',]]
		# 	board = Board.new grid: mocked_grid
		# 	expect { board.set_value 0, 0, 7 }.to raise_error('Not Valid Placement')
		# end

	end

	# it 'board can identify if game has been won' do
	# 	board = Board.new
	# 	board.stub(:winner?) {true}
	# 	expect(board.game_over).to eq :winner
	# end

end