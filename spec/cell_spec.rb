require 'cell'

describe Cell do
	
	it('is initialized with an empty value by default') do
		cell = Cell.new
		expect(cell.value).to eq '_'
	end

	it('can be initialized with a value if specified') do
		cell = Cell.new value: '7'
		expect(cell.value).to eq '7'
	end


end