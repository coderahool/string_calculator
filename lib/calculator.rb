class Calculator
  def add(numbers)
    delimiter = ","

    if numbers.start_with?("//")
      delimiter = numbers.match(/\/\/(.)\n/).captures[0]
      numbers = numbers.gsub(/\/\/(.)\n/, "")
    end

    # Split based on both comma and newline delimiters
    numbers.split(/#{delimiter}|\n/).map(&:to_i).sum
  end
end