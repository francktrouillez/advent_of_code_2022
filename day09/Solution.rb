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
        direction = case action.first
          when "U"
            [0, 1]
          when "D"
            [0, -1]
          when "R"
            [1, 0]
          when "L"
            [-1, 0]
        end
        value.times { @rope.move(direction) }
      end
  end
end

