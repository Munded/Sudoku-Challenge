describe 'grid' do
	it 'initialises with a 9x9 grid' do
		board = Board.new
		expect(board[0]).to eq {a1: 0, a2: 0, a3: 0, a4: 0, a5: 0, a6: 0, a7: 0, a8: 0, a9: 0 }
	end

	xit 'can place a number' do
		board = Board.new
		board.place 1
		expect(board).to eq []
	end
end