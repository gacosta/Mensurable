require 'spec_helper'

describe Mensurable::Magnitude do
	it 'requires to be initialized with some of its measures' do
		expect { Mensurable::Magnitude.new }.to raise_error(ArgumentError)
	end

	context 'once defined' do
		# let(:certain_magnitude) { Mensurable::Magnitude.new 'some_unit' => 1}

		it 'is measured' do
			expect(Mensurable::Magnitude).to respond_to :new_measure
		end
	end
end