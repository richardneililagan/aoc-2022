# frozen_string_literal: true

require "spec_helper"

RSpec.describe Year2022::Day04 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/04/input.txt")) }
  let(:example_input) {
    <<~EOF
      2-4,6-8
      2-3,4-5
      5-7,7-9
      2-8,3-7
      6-6,4-6
      2-6,4-8
    EOF
  }

  describe "part 1" do
    it "returns correct answers for examples" do
      solution = described_class.part_1(example_input)
      expect(solution).to eq 2
    end
  end

  describe "part 2" do
    it "returns correct answers for examples" do
      solution = described_class.part_2(example_input)
      expect(solution).to eq 4
    end
  end
end
