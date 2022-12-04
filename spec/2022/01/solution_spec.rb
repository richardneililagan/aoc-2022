# frozen_string_literal: true

require "benchmark"
require "spec_helper"

RSpec.describe Year2022::Day01 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/01/input.txt")) }
  let(:example_input) do
    <<~EOF
      1000
      2000
      3000

      4000

      5000
      6000

      7000
      8000
      9000

      10000
    EOF
  end

  describe "part 1" do
    it "returns the correct answer from examples" do
      solution = described_class.part_1(example_input)
      expect(solution).to eq(24_000)
    end
  end

  describe "part 2" do
    it "returns the correct answer from examples" do
      solution = described_class.part_2(example_input)
      expect(solution).to eq(45_000)
    end
  end

  describe "benchmarks" do
    it "performs benchmarks", benchmark: true do
      run_benchmarks described_class
    end
  end
end
