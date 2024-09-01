require 'spec_helper'
require './lib/calculator'

RSpec.describe  Calculator do
  describe "#add" do
    it "adds an empty string" do
      expect(Calculator.new.add("")).to eq(0)
    end

    it "adds a single number" do
      expect(Calculator.new.add("5")).to eq(5)
    end

    it "handles a large number of numbers" do
      numbers = (1..1000).to_a.join(",")
      expect(Calculator.new.add(numbers)).to eq(500500)
    end

    it "handles newlines between numbers" do
      expect(Calculator.new.add("1\n2,3")).to eq(6)
    end

    it "handles custom delimiters" do
      expect(Calculator.new.add("//;\n1;2")).to eq(3)
    end

    it "handles other custom delimiters" do
      expect(Calculator.new.add("//|\n2|2")).to eq(4)
    end

    it "handles empty strings with delimiters" do
      expect(Calculator.new.add("//;\n")).to eq(0)
    end

    it "throws an exception for negative numbers" do
      expect { Calculator.new.add("-1,-4,2") }.to raise_error(ArgumentError, "negative numbers not allowed -1, -4")
    end

    it "ignores numbers greater than 1000" do
      expect(Calculator.new.add("2,1001")).to eq(2)
    end

    it "handles delimiters of arbitrary length" do
      expect(Calculator.new.add("//[***]\n1***2***3")).to eq(6)
    end

    it "handles multiple custom delimiters" do
      expect(Calculator.new.add("//[*][%]\n1*2%3")).to eq(6)
    end
  end
end