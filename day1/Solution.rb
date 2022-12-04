require_relative "../helpers/Solution"

module Day01
  class Solution < ::Solution
    def generate_output_1
      calories.max
    end

    def generate_output_2
      calories.sort.reverse[...3].sum
    end

    def calories
      input.reduce([0]) { |acc, i| i.empty? ? acc + [0] : (acc[-1] += i.to_i) && acc }
    end
  end
end
