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

  let(:example_input_2) {
    <<~EOF
      R 5
      U 8
      L 8
      D 3
      R 17
      D 10
      L 25
      U 20
    EOF
  }

  describe "part 1" do
    it "returns correct answers for samples" do
      solution = described_class.part_1(example_input)
      expect(solution).to eq(13)
    end
  end

  describe "part 2" do
    it "returns correct answers for shorter sample" do
      solution = described_class.part_2(example_input)
      expect(solution).to eq(1)
    end

    it "returns correct answers for longer sample" do
      solution = described_class.part_2(example_input_2)
      expect(solution).to eq(36)
    end
  end

  describe "benchmarks", benchmark: true do
    it "performs benchmarks" do
      run_benchmarks described_class
    end
  end
end
