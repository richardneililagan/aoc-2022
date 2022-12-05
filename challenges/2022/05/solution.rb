# frozen_string_literal: true

module Year2022
  class Day05 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      crate_arrangement = data.take_while { |line| !line.strip.empty? }
      instructions = data.drop_while { |line| !line.strip.empty? }[1..]

      # :: Reverse crate_arrangement so that we can parse it top to bottom.
      #    Let's drop the first row as well because that's just column numbering.
      crate_arrangement = crate_arrangement.reverse[1..]

      # :: Split the crate arrangements into 4 characters each,
      #    and keeping only the 2nd character as that designated the crate ID.
      crate_ids = crate_arrangement
        .map do |line|
          line.scan(/.{1,4}/).map { |crate| crate[1] }
        end

      # :: How many crate columns do we have?
      #    We determine this by counting the crates in the bottom row.
      column_count = crate_ids[0].count

      # :: Initialize our columns with empty arrays.
      crate_columns = Array.new(column_count).map { || [] }

      # :: Then put the crates in their columns:
      crate_columns = crate_ids.reduce(crate_columns) do |acc, row|
        row.each_index { |i| acc[i] << row[i] unless row[i].strip.empty? }
        acc
      end

      # :: Parse each instruction:
      parsed_movements = instructions.map do |instruction|
        instruction.match(/^move (?<count>\d+) from (?<from>\d+) to (?<to>\d+)$/).named_captures
      end

      # :: Finally perform each action
      parsed_movements.each do |instruction|
        count, from, to = instruction.values_at("count", "from", "to").map(&:to_i)

        crates_to_move = crate_columns[from - 1].pop(count)
        crate_columns[to - 1] += crates_to_move.reverse
      end

      # :: Get the last crate of each column
      crate_columns.map(&:last).join
    end

    def part_2
      # :: Part 2 is literally the same process, but without the final step above
      #    of reversing the crates being moved (:46)
      crate_arrangement = data.take_while { |line| !line.strip.empty? }
      instructions = data.drop_while { |line| !line.strip.empty? }[1..]

      # :: Reverse crate_arrangement so that we can parse it top to bottom.
      #    Let's drop the first row as well because that's just column numbering.
      crate_arrangement = crate_arrangement.reverse[1..]

      # :: Split the crate arrangements into 4 characters each,
      #    and keeping only the 2nd character as that designated the crate ID.
      crate_ids = crate_arrangement
        .map do |line|
          line.scan(/.{1,4}/).map { |crate| crate[1] }
        end

      # :: How many crate columns do we have?
      #    We determine this by counting the crates in the bottom row.
      column_count = crate_ids[0].count

      # :: Initialize our columns with empty arrays.
      crate_columns = Array.new(column_count).map { || [] }

      # :: Then put the crates in their columns:
      crate_columns = crate_ids.reduce(crate_columns) do |acc, row|
        row.each_index { |i| acc[i] << row[i] unless row[i].strip.empty? }
        acc
      end

      # :: Parse each instruction:
      parsed_movements = instructions.map do |instruction|
        instruction.match(/^move (?<count>\d+) from (?<from>\d+) to (?<to>\d+)$/).named_captures
      end

      # :: Finally perform each action
      parsed_movements.each do |instruction|
        count, from, to = instruction.values_at("count", "from", "to").map(&:to_i)

        crates_to_move = crate_columns[from - 1].pop(count)
        crate_columns[to - 1] += crates_to_move # :: No reversing!
      end

      # :: Get the last crate of each column
      crate_columns.map(&:last).join
    end

    private
  end
end
