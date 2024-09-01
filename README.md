# String Calculator

This Ruby on Rails project implements a simple string calculator with the following features:

* Accepts a string of comma-separated numbers as input.
* Returns the sum of the numbers as an integer.
* Handles newlines between numbers.
* Supports custom delimiters specified at the beginning of the string.
* Throws an exception for negative numbers.
* Ignores numbers greater than 1000.

## Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/string_calculator.git

2. **Navigate to the Project Directory**

   ```bash
   cd string_calculator

3. Install Dependencies
   ```bash
   bundle install

## Usage

### Basic Usage

To use the calculator, create an instance of the `Calculator` class and call the `add` method with a string of numbers.

```markdown
calculator = Calculator.new
result = calculator.add("1,2,3")
puts result  # Output: 6

### Custom Delimiters

You can specify custom delimiters at the beginning of the string using the format '//[delimiter]\n'.

```markdown
calculator.add("//;\n1;2;3") # => 6

### Delimiters of Any Length

Custom delimiters can be of arbitrary length.

```markdown
calculator.add("//[***]\n1***2***3") # => 6

### Multiple Custom Delimiters

You can specify multiple delimiters.

```markdown
calculator.add("//[***][%%]\n1***2%%3") # => 6

### Handling Newlines

The calculator can handle newlines between numbers.

```markdown
calculator.add("1\n2,3") # => 6

### Ignoring Numbers Greater than 1000

Numbers greater than 1000 are ignored in the calculation.

```markdown
calculator.add("2,1001") # => 2

### Negative Numbers

If the input string contains negative numbers, an ArgumentError will be raised.

```markdown
calculator.add("-1,2,3") # => Raises ArgumentError


## Testing

To run the test suite, use RSpec:

```markdown
bundle exec rspec


## Ruby and Rails Versions

* **Ruby version**: 3.2.0
* **Rails version**: 7.1.4

## Contributing

1. **Fork the repository.**
2. **Create a new branch**:
    ```markdown
    git checkout -b feature/your-feature
3. **Commit your changes (git commit -am 'Add new feature').**
4. **Push to the branch (git push origin feature/your-feature).**
5. **Create a new Pull Request.**