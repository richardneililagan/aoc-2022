# frozen_string_literal: true

require "spec_helper"

RSpec.describe Year2022::Day06 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/06/input.txt")) }

  let(:sample_01) { "mjqjpqmgbljsphdztnvjfqwrcgsmlb" }
  let(:sample_02) { "bvwbjplbgvbhsrlpgdmjqwftvncz" }
  let(:sample_03) { "nppdvjthqldpwncqszvftbrmjlhg" }
  let(:sample_04) { "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg" }
  let(:sample_05) { "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw" }

  describe "part 1" do
    it "returns the correct answers for samples provided" do
      expect(described_class.part_1(sample_01)).to eq(7)
      expect(described_class.part_1(sample_02)).to eq(5)
      expect(described_class.part_1(sample_03)).to eq(6)
      expect(described_class.part_1(sample_04)).to eq(10)
      expect(described_class.part_1(sample_05)).to eq(11)
    end
  end

  describe "part 2" do
    it "returns the correct answers for samples provided" do
      expect(described_class.part_2(sample_01)).to eq(19)
      expect(described_class.part_2(sample_02)).to eq(23)
      expect(described_class.part_2(sample_03)).to eq(23)
      expect(described_class.part_2(sample_04)).to eq(29)
      expect(described_class.part_2(sample_05)).to eq(26)
    end
  end
end
