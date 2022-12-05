class Solution
  attr_accessor :input

  def initialize(test: false)
    self.input = File.readlines(test ? "test/input.txt" : "input.txt").map(&:chomp)
  end

  def print_output
    puts output
  end

  def write_output
    File.write("output.txt", output)
  end

  def output
    "Output 1 : #{output_1.to_s}\nOutput 2 : #{output_2.to_s}"
  end

  def output_1
    @output_1 ||= generate_output_1
  end

  def output_2
    @output_2 ||= generate_output_2
  end

  def generate_output_1
    raise "Not implemented"
  end

  def generate_output_2
    raise "Not implemented"
  end
end
