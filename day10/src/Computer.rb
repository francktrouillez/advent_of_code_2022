require_relative "./CRT"

module Day10
  class Computer
    attr_accessor :x, :cycles, :scores

    def initialize
      @x = 1
      @cycles = 0
      @queue = [[:noop]]
      @crt = CRT.new
      @scores = [0]
    end

    def noop
      @queue.append([:noop])
    end

    def addx(value)
      @queue.append([:noop])
      @queue.append([:addx, value.to_i])
    end

    def compute
      cycle_instruction = @queue.shift
      cycle_instruction.first == :addx && @x += cycle_instruction.last
      @crt.add_pixel(@x, @cycles)
      @cycles += 1
      @scores.append(@x * @cycles)
    end

    def output
      @crt.output
    end
  end
end
