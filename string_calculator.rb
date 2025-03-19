class StringCalculator
  def self.add(input)
    0 if input.empty?
    numbers = extract_numbers(input)

    negative_numbers = numbers.select{ |number| number < 0 }
    if negative_numbers.any?
      raise "Negatives not allowed: #{negative_numbers.join(', ')}"
    end

    numbers.sum
  end

  def self.extract_numbers(input)
    delimiter = ","
    if input.start_with?("//")
      delimiter = input.split("\n", 2).first[2..-1]
      input = input.split("\n", 2).last
    end
    number_lines = input.split("\n")
    number_lines.map{ |number| number.split(delimiter).map(&:to_i) }.flatten
  end
end