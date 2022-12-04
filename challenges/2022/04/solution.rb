# frozen_string_literal: true

module Year2022
  class Day04 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      overlaps = data.filter do |line|
        (first, second) = line.split ","

        (first_min, first_max) = first.split("-").map(&:to_i)
        (second_min, second_max) = second.split("-").map(&:to_i)

        cover =
          (first_min <= second_min && second_max <= first_max) || (second_min <= first_min && first_max <= second_max)

        cover
      end

      overlaps.count
    end

    def part_2
      overlaps = data.filter do |line|
        (first, second) = line.split ","

        (first_min, first_max) = first.split("-").map(&:to_i)
        (second_min, second_max) = second.split("-").map(&:to_i)

        first_r = Range.new first_min, first_max
        second_r = Range.new second_min, second_max

        cover = first_r.include?(second_r.begin) ||
          first_r.include?(second_r.end) ||
          second_r.include?(first_r.begin) ||
          second_r.include?(first_r.end)

        cover
      end

      overlaps.count
    end
  end
end
