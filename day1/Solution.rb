require_relative "../helpers/Solution"

module Day1
  def self.input_file
    "#{underscore(self.to_s)}/input.txt"
  end

  class Solution < ::Solution
    def generate_output_1
      compute.max
    end

    def generate_output_2
      compute.sort.reverse[...3].sum
    end

    def compute
      calories = [0]
      input.each do |input_line|
        next calories[-1] += input_line.to_i unless input_line.empty?

        calories.append(0)
      end
      calories
    end
  end
end
