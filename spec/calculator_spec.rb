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
  end
end