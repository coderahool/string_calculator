class Calculator
  def add(numbers)
    delimiter = ","

    if numbers.start_with?("//")
      delimiter = numbers.match(/\/\/(.)\n/)&.captures&.first
      numbers = numbers.gsub(/\/\/(.)\n/, "")
    end

    negative_numbers = numbers.split(/#{delimiter}|\n/).select { |num| num.to_i < 0 }

    if negative_numbers.any?
      raise ArgumentError, "negative numbers not allowed #{negative_numbers.join(', ')}"
    end
    # Split based on delimiters
    numbers.split(/#{delimiter}|\n/).compact.map(&:to_i).sum
  end
end