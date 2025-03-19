class StringCalculator
  def self.add(input)
    0 if input.empty?
    numbers = extract_numbers(input)
    numbers.sum
  end

  def extract_numbers(input)
    if input.include?("\n")
      number_lines = input.split("\n")
      number_lines.flatten!
      numbers = number_lines.map(&:to_i)
    else
      numbers = input.split(",").map(&:to_i)
    end
  end
end