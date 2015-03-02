require 'spec_helper'

describe Mensurable do
  it 'has a version number' do
    expect(Mensurable::VERSION).not_to be nil
  end

  it 'allows to define a physical magnitude with some of its equivalent measures' do
    Weight = Mensurable::Magnitude.new g: 1, kg: 1e3
    expect(Weight).to be_a Class
  end

  context 'given an already defined magnitude' do
  	Length = Mensurable::Magnitude.new m: 1, km: 1e3
  	
  	it 'allows to refer to some of its measures' do
  		expect(3.m).to be_instance_of Length
  	end

    it 'allows its measures to be scaled up' do
      expect(6.m * 5).to eq 30.m
    end

    it 'allows its measures to be scaled down' do
      expect(30.m / 5).to eq 6.m
    end

    it 'allows its measures to be compared' do
      expect(1.km > 1.m).to be true
    end

    it 'allows its measures to be converted to equivalent measures' do
      expect(1.km.m).to eq 1000.0.m
    end
    
    it 'allows its measures to be combined' do
      expect(1.km + 5.m).to eq 1005.0.m
    end
  end
end
