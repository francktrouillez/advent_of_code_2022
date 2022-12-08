require_relative "../helpers/Solution"

module Day06
  class Solution < ::Solution
    def generate_output_1
      start_of_packet 4
    end

    def generate_output_2
      start_of_packet 14
    end

    def start_of_packet(size)
      input.first.split("").each_cons(size).to_a.index { |e| e.uniq.length == size } + size
    end
  end
end

