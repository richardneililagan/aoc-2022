# frozen_string_literal: true

module Year2022
  class Day02 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    @@win_patterns = ['A B', 'B C', 'C A']
    @@shape_scores = {
      A: 1,
      B: 2,
      C: 3
    }

    def part_1
      scores = data
               .map { |line| line.gsub('X', 'A').gsub('Y', 'B').gsub('Z', 'C') }
               .map do |line|
        is_draw = line[0] == line[2]
        is_win = @@win_patterns.include? line

        shape_score = @@shape_scores[line[2].to_sym]
        round_score = (
          if is_win
            6
          elsif is_draw
            3
          else
            0
          end
        )

        shape_score + round_score
      end

      scores.sum
    end

    def part_2
      pattern_offsets = {
        X: -1, # :: loss
        Y: 0,  # :: draw
        Z: 1   # :: win
      }

      # :: Pattern beats pattern immediately before.
      pattern_map = %w[A B C]

      scores = data.map do |line|
        opponent = line[0]
        target_result = line[2]

        current_pattern_index = pattern_map.index opponent
        target_pattern_index = (current_pattern_index + pattern_offsets[target_result.to_sym]) % 3
        target_pattern = pattern_map[target_pattern_index]

        shape_score = @@shape_scores[target_pattern.to_sym]
        round_score = (pattern_offsets[target_result.to_sym] + 1) * 3

        shape_score + round_score
      end

      scores.sum
    end
  end
end
