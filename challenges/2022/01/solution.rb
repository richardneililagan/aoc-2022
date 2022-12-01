# frozen_string_literal: true

module Year2022
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      backpacks = data.chunk_while { |a, i| a != '' && i != '' }.to_a
      calories = backpacks
                 .map { |backpack| backpack.map(&:to_i).sum }

      calories.max
    end

    def part_2
      backpacks = data.chunk_while { |a, i| a != '' && i != '' }.to_a
      calories = backpacks
                 .map { |backpack| backpack.map(&:to_i).sum }

      top = calories.sort.reverse

      top[0..2].sum
    end
  end
end
