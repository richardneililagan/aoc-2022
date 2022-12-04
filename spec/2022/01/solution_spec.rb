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

  def run_benchmarks(solution_class)
    Benchmark.bmbm do |benchmark|
      benchmark.report("Part 1:") do
        solution_class.part_1(input)
      end

      benchmark.report("Part 2:") do
        solution_class.part_2(input)
      end
    end
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
      print "2022 D1"
      run_benchmarks described_class
    end
  end
end
