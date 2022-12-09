require_relative "../helpers/Solution"

module Day05
  class Solution < ::Solution
    NUMERIC_REGEX = /[0-9]+/

    def generate_output_1
      separator_index = input.index(&:empty?)
      generate_crates(input[...separator_index])
      input[(separator_index + 1)..-1].each { |i| apply(i, keep_order: false) }
      crates.map(&:last).join("")
    end

    def generate_output_2
      separator_index = input.index(&:empty?)
      generate_crates(input[...separator_index])
      input[(separator_index + 1)..-1].each { |i| apply(i, keep_order: true) }
      crates.map(&:last).join("")
    end

    private

      def generate_crates(input_crates)
        reset_crates
        number_of_crates = input_crates[-1].scan(NUMERIC_REGEX).size
        input_crates[...-1].reverse_each do |stack_line|
          number_of_crates.times do |i|
            crates[i] ||= []
            supply = stack_line[4 * i + 1]
            crates[i] << supply if supply && !supply.strip.empty?
          end
        end
      end

      def apply(input_move, keep_order:)
        move = translate_move(input_move)
        crates[move[2]] += keep_order ? crates[move[1]][-move[0]..-1] : crates[move[1]][-move[0]..-1].reverse
        crates[move[1]] = crates[move[1]][...-move[0]]
      end

      def translate_move(input_move)
        move = input_move.split(" ").filter { |e| e.match? NUMERIC_REGEX }.map(&:to_i)
        [move.first] + move[1..].map { |e| e - 1 }
      end

      def reset_crates
        @crates = []
      end

      def crates
        @crates
      end
  end
end

