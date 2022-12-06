# frozen_string_literal: true

module Year2022
  class Day06 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      find_marker data, 4
    end

    def part_2
      find_marker data, 14
    end

    private

    def find_marker(input, marker_length)
      counter = 0
      input.chars.each_cons(marker_length) do |chars|
        return counter + marker_length if chars.uniq.length == marker_length
        counter += 1
      end
    end
  end
end
