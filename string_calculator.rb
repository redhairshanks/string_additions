class StringCalculator
  def self.add(input)
    0 if input.empty?
    numbers = extract_numbers(input)
    numbers.sum
  end

  def extract_numbers(input)
    input.split(',').map(&:to_i)
  end
end