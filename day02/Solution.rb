require_relative "../helpers/Solution"

require_relative "./src/Game"

module Day02
  class Solution < ::Solution
    include Game

    def generate_output_1
      input.reduce(0) do |acc, input_line|
        opponent, player = input_line.split
        acc + score(opponent, player)
      end
    end

    def generate_output_2
      input.reduce(0) do |acc, input_line|
        opponent, outcome = input_line.split
        acc + score(opponent, move(opponent, outcome))
      end
    end
  end
end
