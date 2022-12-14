# frozen_string_literal: true

require "spec_helper"

RSpec.describe Year2022::Day05 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/05/input.txt")) }
  let(:example_input) {
    <<~EOF
          [D]    
      [N] [C]    
      [Z] [M] [P]
       1   2   3 
      
      move 1 from 2 to 1
      move 3 from 1 to 3
      move 2 from 2 to 1
      move 1 from 1 to 2
    EOF
  }

  describe "part 1" do
    it "returns the correct answer for the examples" do
      solution = described_class.part_1(example_input)
      expect(solution).to eq("CMZ")
    end
  end

  describe "part 2" do
    it "returns the correct answer for the examples" do
      solution = described_class.part_2(example_input)
      expect(solution).to eq("MCD")
    end
  end

  describe "benchmarks", benchmark: true do
    it "performs benchmarks" do
      run_benchmarks described_class
    end
  end
end
