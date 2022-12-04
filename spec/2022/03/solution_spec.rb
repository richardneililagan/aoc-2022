# frozen_string_literal: true

require "spec_helper"

RSpec.describe Year2022::Day03 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/03/input.txt")) }
  let(:example_input) {
    <<~EOF
      vJrwpWtwJgWrhcsFMMfFFhFp
      jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      PmmdzqPrVvPwwTWBwg
      wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      ttgJtRGJQctTZtZT
      CrZsJsPPZsGzwwsLwLmpwMDw
    EOF
  }

  describe "part 1" do
    it "returns correct answers for examples" do
      solution = described_class.part_1(example_input)
      expect(solution).to eq(157)
    end
  end

  describe "part 2" do
    it "returns correct answers for examples" do
      solution = described_class.part_2(example_input)
      expect(solution).to eq(70)
    end
  end
end
