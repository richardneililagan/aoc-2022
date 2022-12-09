# frozen_string_literal: true

module Year2022
  class Day09 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    @@direction_step = {
      "R" => [1, 0],
      "L" => [-1, 0],
      "U" => [0, 1],
      "D" => [0, -1]
    }

    def part_1
      h = [0, 0]
      t = [0, 0]
      positions_visited = Set.new
      positions_visited << t

      data.each do |line|
        direction, count = line.match(/^(?<direction>[A-Z])\s(?<count>\d+)$/).captures
        step = @@direction_step[direction]

        (0...(count.to_i)).each do
          # :: Move the head
          h = h.zip(step).map { |m, n| m + n }

          # :: Do we need to move the tail as well?
          if should_tail_move?(h, t)
            t = t.clone

            # :: Diagonal tail movement
            if h[0] != t[0] && h[1] != t[1]
              t[0] = t[0] + ((h[0] - t[0]) / (h[0] - t[0]).abs)
              t[1] = t[1] + ((h[1] - t[1]) / (h[1] - t[1]).abs)

            # :: Horizontal tail movement
            elsif h[0] != t[0]
              t[0] = t[0] + ((h[0] - t[0]) / (h[0] - t[0]).abs)

            # :: Vertical tail movement
            elsif h[1] != t[1]
              t[1] = t[1] + ((h[1] - t[1]) / (h[1] - t[1]).abs)

            end

            # :: Register new tail position
            positions_visited << t
          end
        end
      end

      positions_visited.count
    end

    def part_2
      nil
    end

    private

    def should_tail_move?(h, t)
      distances = [
        h[0] - t[0],
        h[1] - t[1]
      ].map(&:abs)

      (
        distances[0] > 1 || distances[1] > 1 || distances.sum > 2
      )
    end
  end
end
