require_relative "../helpers/Solution"

require_relative "./src/Rope"

module Day09
  class Solution < ::Solution
    def generate_output_1
      run(2)
      @rope.markers.size
    end

    def generate_output_2
      run(10)
      @rope.markers.size
    end

    private

      def run(number_of_knots)
        @rope = Rope.new(number_of_knots)
        input.each do |i|
          apply(i)
        end
      end

      def apply(instruction)
        action = instruction.split
        value = action.last.to_i
        move = [0, 0]
        case action.first
          when "U"
            move[1] = value
          when "D"
            move[1] = -value
          when "R"
            move[0] = value
          when "L"
            move[0] = -value
        end
        @rope.move(move)
      end
  end
end

