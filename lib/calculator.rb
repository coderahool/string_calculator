class Calculator
  def initialize(delimiter = ",")
    @delimiter = delimiter
  end

  def add(numbers)
    if numbers.start_with?("//")
      if numbers =~ /\/\/(\[.+?\])+\n/
        delimiters = numbers.scan(/\[(.+?)\]/).flatten
        @delimiter = delimiters.map { |delim| Regexp.escape(delim) }.join("|")
      else
        @delimiter = Regexp.escape(numbers[2])
      end
      numbers = numbers.split("\n", 2).last
    end
    return 0 if numbers.empty?
    validate_positive_numbers(numbers, @delimiter)
    numbers = split_numbers(numbers, @delimiter)
    numbers.map(&:to_i).reduce(@delimiter == "\\*" ? :* : :+)
  end

  private

  def split_numbers(numbers, delimiter)
    numbers.split(/#{delimiter}|\n/).reject { |num| num.to_i > 1000 }
  end

  def validate_positive_numbers(numbers, delimiter)
    negative_numbers = split_numbers(numbers, delimiter).select { |num| num.to_i < 0 }
    raise ArgumentError, "negative numbers not allowed #{negative_numbers.join(', ')}" if negative_numbers.any?
  end
end