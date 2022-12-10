require_relative "../helpers/Solution"

require_relative "./src/Computer"

module Day10
  class Solution < ::Solution
    def generate_output_1
      run(220)
      (1..6).map { |i| i * 40 - 20 }.reduce(0) { |acc, i| acc + computer.scores[i] }
    end

    def generate_output_2
      run(240)
      @computer.output
    end

    private

      def run(number_of_cycles)
        (number_of_cycles - computer.cycles).times { computer.compute }
      end

      def instruction(command, value = nil)
        @computer.send(command.to_sym, *value)
      end

      def computer
        (@computer ||= Computer.new and input.each { |i| instruction(*i.split) }) && @computer
      end
  end
end

