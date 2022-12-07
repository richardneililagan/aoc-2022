# frozen_string_literal: true

require "spec_helper"

RSpec.describe Year2022::Directory do
  it "initializes properly" do
    dir = described_class.new "root"

    expect(dir.name).to eq("root")
    expect(dir.instance_variable_get(:@files).length).to eq(0)
    expect(dir.instance_variable_get(:@child_directories).length).to eq(0)
  end

  it "creates new directories if they don't exist" do
    dir = described_class.new "root"
    cdir = dir.cd "foo"

    children = dir.instance_variable_get(:@child_directories)

    expect(children.length).to eq 1
    expect(children.first.name).to eq "foo"
    expect(cdir).to eq children.first
  end
end

RSpec.describe Year2022::Day07 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/07/input.txt")) }
  let(:example_input) {
    <<~EOF
      $ cd /
      $ ls
      dir a
      14848514 b.txt
      8504156 c.dat
      dir d
      $ cd a
      $ ls
      dir e
      29116 f
      2557 g
      62596 h.lst
      $ cd e
      $ ls
      584 i
      $ cd ..
      $ cd ..
      $ cd d
      $ ls
      4060174 j
      8033020 d.log
      5626152 d.ext
      7214296 k
    EOF
  }

  describe "part 1" do
    it "returns correct answers from samples" do
      solution = described_class.part_1(example_input)
      expect(solution).to eq(95437)
    end
  end

  describe "part 2" do
    it "returns correct answers from samples" do
      solution = described_class.part_2(example_input)
      expect(solution).to eq(24933642)
    end
  end
end
