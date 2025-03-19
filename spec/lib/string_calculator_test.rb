require 'string_calculator'

describe StringCalculator do
  describe '.add' do
    it 'returns 0 for empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end

    it 'returns number for single number' do 
      expect(StringCalculator.add('1')).to eq(1)
    end
  end
end