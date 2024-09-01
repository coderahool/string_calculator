require 'spec_helper'
require './lib/calculator'

RSpec.describe  Calculator do
  describe "#add" do
    it "adds an empty string" do
      expect(Calculator.new.add("")).to eq(0)
    end
  end
end