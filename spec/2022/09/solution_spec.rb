# frozen_string_literal: true

require "spec_helper"

RSpec.describe Year2022::Day09 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/09/input.txt")) }
  let(:example_input) {
    <<~EOF
      R 4
      U 4
      L 3
      D 1
      R 4
      D 1
      L 5
      R 2
    EOF
  }

  describe "part 1" do
    it "returns correct answers for samples" do
      solution = described_class.part_1(example_input)
      expect(solution).to eq(13)
    end
  end

  describe "part 2" do
    # it "returns nil for the example input" do
    #   expect(described_class.part_2(example_input)).to be_nil
    # end

    # it "returns nil for my input" do
    #   expect(described_class.part_2(input)).to be_nil
    # end
  end
end
