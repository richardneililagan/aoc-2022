# frozen_string_literal: true

module Year2022
  class Day10 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      # :: Store changes in values to the register at the precise cycle time.
      #
      #    ie. cycle_keystone[100] = 200
      #        >> register was set to 200 at start of cycle 100.
      cycle_keystones = {}
      current_cycle = 0
      register = 1

      data.each do |line|
        current_cycle += 1
        next if /^noop/.match?(line)

        # :: else, this is an `addx` operation.
        delta = line.match(/^addx\s(?<delta>-?\d+)$/).captures.first.to_i

        register += delta
        cycle_keystones[current_cycle + 2] = register
        current_cycle += 1
      end

      interesting_cycles = [20, 60, 100, 140, 180, 220]
      signals = interesting_cycles.map do |cycle|
        nearest_key_to_cycle = cycle_keystones.keys.filter { |key| key <= cycle }.last
        value_at_cycle = cycle_keystones[nearest_key_to_cycle]

        value_at_cycle * cycle
      end

      signals.sum
    end

    def part_2
      cycle_keystones = {1 => 1}
      current_cycle = 0
      register = 1

      screen = Array.new(6).map { [] }

      data.each do |line|
        current_cycle += 1
        next if /^noop/.match?(line)

        # :: else, this is an `addx` operation.
        delta = line.match(/^addx\s(?<delta>-?\d+)$/).captures.first.to_i

        register += delta
        cycle_keystones[current_cycle + 2] = register
        current_cycle += 1
      end

      (1..240).each do |cycle|
        nearest_key_to_cycle = cycle_keystones.keys.filter { |key| key <= cycle }.last
        value_at_cycle = cycle_keystones[nearest_key_to_cycle]

        screen_row = (cycle - 1) / 40
        pixel = (value_at_cycle..value_at_cycle + 2).cover?((cycle - 1) % 40 + 1) ? "#" : "."
        screen[screen_row] << pixel
      end

      print "\n\n---\n\n"
      screen.each do |row|
        print "#{row.join}\n"
      end
      print "\n\n---\n\n"

      nil
    end
  end
end
