require_relative "../helpers/Solution"

module Day04
  class Solution < ::Solution
    def generate_output_1
      get_overlapping_pairs(include_all: true)
    end

    def generate_output_2
      get_overlapping_pairs(include_all: false)
    end

    def get_overlapping_pairs(include_all:)
      op = include_all ? :& : :|
      input.reduce(0) do |acc, input_line|
        pair = input_line.split(",").map { |i| i.split("-").map(&:to_i) }
        ([pair, pair.reverse].map { |p| p[0].map { |e| e.between? *p[1] }.inject(op) }.inject(:|) ? 1 : 0) + acc
      end
    end
  end
end

