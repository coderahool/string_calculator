class Calculator
  def add(numbers)
    delimiter = ","

    if numbers.start_with?("//")
      delimiter = numbers.match(/\/\/(.)\n/)&.captures&.first
      numbers = numbers.gsub(/\/\/(.)\n/, "")
    end

    # Split based on delimiters
    numbers.split(/#{delimiter}|\n/).compact.map(&:to_i).sum
  end
end