require_relative "../helpers/Solution"

require_relative "./src/Monkey"

module Day11
  class Solution < ::Solution
    def generate_output_1
      generate_monkeys relief_feeling: true
      20.times { play_round }
      @monkeys.map(&:number_of_operations).sort.reverse[...2].inject(:*)
    end

    def generate_output_2
      generate_monkeys relief_feeling: false
      10000.times { play_round }
      @monkeys.map(&:number_of_operations).sort.reverse[...2].inject(:*)
   end

    private

      def generate_monkeys(relief_feeling:)
        @monkeys = input.each_slice(7).map do |monkey_strings|
          Monkey.new(monkey_strings[1..5], relief_feeling: relief_feeling)
        end
        least_common_multiple = @monkeys.map(&:test_divisor).inject(&:lcm)
        @monkeys.each { |m| m.set_max_value least_common_multiple }
      end

      def play_round
        @monkeys.each do |m|
          m.operation
          m.test.each do |i|
            @monkeys[i].items.append(m.items.shift)
          end
        end
      end
  end
end

