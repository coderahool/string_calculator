class Calculator
  def add(numbers)
    numbers.gsub("\n", ",").split(",").map(&:to_i).sum
  end
end