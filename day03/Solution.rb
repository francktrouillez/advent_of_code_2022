require_relative "../helpers/Solution"

module Day03
  class Solution < ::Solution
    def generate_output_1
      input.map { |i| i.split "" }.map { |r| priority r.each_slice(r.size / 2).inject(:&).first }.sum
    end

    def generate_output_2
      input.map { |i| i.split "" }.each_slice(3).map { |group| priority group.inject(:&).first }.sum
    end

    private

      def priority(item)
        item.ord - (/[[:upper:]]/.match?(item) ? "A".ord - 27: "a".ord - 1)
      end
  end
end
