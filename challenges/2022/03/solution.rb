# frozen_string_literal: true

module Year2022
  class Day03 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    @@item_types = ("a".."z").to_a | ("A".."Z").to_a

    def part_1
      priorities = data.map do |line|
        first_rucksack = line[0..(line.length / 2 - 1)].chars
        second_rucksack = line[(line.length / 2)..(line.length - 1)].chars

        common = first_rucksack & second_rucksack

        (@@item_types.index common[0]) + 1
      end

      priorities.sum
    end

    def part_2
      priorities = data.each_slice(3).map do |group|
        (first, second, third) = group.map(&:chars)

        common = first & second & third

        (@@item_types.index common[0]) + 1
      end

      priorities.sum
    end
  end
end
