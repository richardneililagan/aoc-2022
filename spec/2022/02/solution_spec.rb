# frozen_string_literal: true

require 'benchmark'
require 'spec_helper'

RSpec.describe Year2022::Day02 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/02/input.txt')) }
  let(:example_input) do
    <<~EOF
      A Y
      B X
      C Z
    EOF
  end

  describe 'part 1' do
    it 'returns correct answers from example' do
      solution = described_class.part_1(example_input)
      expect(solution).to eq(15)
    end
  end

  describe 'part 2' do
    it 'returns correct answers from example' do
      solution = described_class.part_2(example_input)
      expect(solution).to eq(12)
    end
  end

  describe 'benchmarks' do
    it 'performs benchmarks' do
      print '2022 D2'

      Benchmark.bmbm do |benchmark|
        benchmark.report('Part 1:') do
          described_class.part_1(input)
        end

        benchmark.report('Part 2:') do
          described_class.part_2(input)
        end
      end
    end
  end
end
