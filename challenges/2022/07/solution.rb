# frozen_string_literal: true

module Year2022
  class Directory
    attr_reader :name

    def initialize(name, parent_directory = nil)
      @name = name
      @parent_directory = parent_directory
      @files = []
      @child_directories = []
    end

    def cd(directory_name)
      return @parent_directory if directory_name == ".."

      candidate_directory = @child_directories.find { |d| d.name == directory_name }
      return candidate_directory unless candidate_directory.nil?

      # :: The directory was not found, so let's create it, then return that.
      new_directory = Directory.new directory_name, self
      @child_directories << new_directory

      new_directory
    end

    def add_file(name, size)
      @files << File.new(name, size)
    end

    # TODO this could really use some memoization
    def total_size
      total_descendant_size = @child_directories.map { |dir| dir.total_size }.sum
      total_cwd_size = @files.map { |file| file.size }.sum

      total_descendant_size + total_cwd_size
    end
  end

  class File
    attr_reader :name
    attr_reader :size

    def initialize(name, size)
      @name = name
      @size = size
    end
  end

  class Day07 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      dirs = parse_input

      dir_sizes = dirs.map { |dir| dir.total_size }
      dir_sizes.filter { |size| size <= 100_000 }.sum
    end

    def part_2
      dirs = parse_input
      dir_sizes = dirs.map { |dir| dir.total_size }

      current_space_usage = dir_sizes.max
      minimum_needed_space = 30_000_000 - (70_000_000 - current_space_usage)

      dir_sizes.filter { |size| size >= minimum_needed_space }.min
    end

    private

    def parse_input
      root_dir = Directory.new ""
      current_dir = root_dir
      dirs = Set.new

      data.each do |line|
        if line.match?(/^\$ cd/)
          dir = line.match(/^\$ cd (?<dir>.*)\s*/).named_captures["dir"]

          current_dir = current_dir.cd dir
          dirs << current_dir
        end

        if line.match?(/^\d+.*/)
          captures = line.match(/^(?<size>\d+)\s(?<name>.*)$/).named_captures
          size, name = captures.values_at("size", "name")

          current_dir.add_file name, size.to_i
        end
      end

      dirs
    end
  end
end
