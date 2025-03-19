require_relative '../../string_calculator'

describe StringCalculator do
  describe '.add' do
    it 'returns 0 for empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end

    it 'returns number for single number' do 
      expect(StringCalculator.add('1')).to eq(1)
    end

    it 'returns sum of two numbers' do
      expect(StringCalculator.add('1,2')).to eq(3)
    end

    it 'returns sum of any numbers' do
      expect(StringCalculator.add('1,2,3,4,5')).to eq(15)
    end

    it 'handles new lines between numbers' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
      expect(StringCalculator.add("1\n2\n3")).to eq(6)
      expect(StringCalculator.add("1\n2\n3\n4\n5,6,7,8")).to eq(36)
    end

    it "handles different delimiters" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
      expect(StringCalculator.add("//;\n1;2;3")).to eq(6)
      expect(StringCalculator.add("//;\n1\n2\n3\n4\n5;6;7;8")).to eq(36)
    end

    it "throws an exception when negative numbers are provided" do
      expect{StringCalculator.add("1,-2")}.to raise_error("Negatives not allowed: -2")
      expect{StringCalculator.add("1,-2,-3")}.to raise_error("Negatives not allowed: -2, -3")
      expect{StringCalculator.add("//;\n1;-2;-3")}.to raise_error("Negatives not allowed: -2, -3")
    end
  end
end