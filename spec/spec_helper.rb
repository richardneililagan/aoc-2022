# frozen_string_literal: true

Dir[File.join(File.dirname(__FILE__), "..", "challenges", "shared", "**", "*.rb")].each do |file|
  require file
end

Dir[File.join(File.dirname(__FILE__), "..", "challenges", "20*", "**", "*.rb")].each do |file|
  require file
end

RSpec.configure do |config|
end

# :: ---

def run_benchmarks(solution_class)
  printf("\n#{solution_class}\n")

  Benchmark.bmbm do |benchmark|
    benchmark.report("Part 1:") do
      solution_class.part_1(input)
    end

    benchmark.report("Part 2:") do
      solution_class.part_2(input)
    end
  end
end
