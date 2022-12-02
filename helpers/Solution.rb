class Solution
  attr_accessor :input

  def initialize(filename)
    self.input = File.readlines(filename).map(&:strip)
  end

  def print_output
    puts "Output 1 : #{generate_output_1.to_s}"
    puts "Output 2 : #{generate_output_2.to_s}"
  end

  def generate_output_1
    raise "Not implemented"
  end

  def generate_output_2
    raise "Not implemented"
  end
end
