class Calculator
  def add(numbers)
    delimiter = ","

    if numbers.start_with?("//")
      if numbers =~ /\/\/\[(.+?)\]\n/
        delimiter = Regexp.escape($1)
      else
        delimiter = Regexp.escape(numbers[2])
      end
      numbers = numbers.split("\n", 2).last
    end

    negative_numbers = numbers.split(/#{delimiter}|\n/).select { |num| num.to_i < 0 }

    if negative_numbers.any?
      raise ArgumentError, "negative numbers not allowed #{negative_numbers.join(', ')}"
    end
    # Split based on delimiters
    numbers.split(/#{delimiter}|\n/).reject { |num| num.to_i > 1000 }.map(&:to_i).sum
  end
end