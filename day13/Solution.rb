require_relative "../helpers/Solution"

module Day13
  class Solution < ::Solution
    def generate_output_1
      input.each_slice(3)
           .map { |pairs| pairs[..2].map { |p| eval p } }
           .map.with_index { |(left, right), i| compare_pair(left, right) ? i + 1: 0 }
           .sum
    end

    def generate_output_2
      sorted_packets = sort_packets((input + ["[[2]]", "[[6]]"]).reject { |i| i.empty? }.map { |i| eval i })
      (sorted_packets.index([[2]]) + 1) * (sorted_packets.index([[6]]) + 1)
    end

    private

      def sort_packets(packets)
        packets.size.times do |i|
          ((i + 1)...packets.size).to_a.each do |j|
            if compare_pair(packets[j], packets[i])
              temp = packets[i]
              packets[i] = packets[j]
              packets[j] = temp
            end
          end
        end
        packets
      end

      def compare_pair(left, right)
        comparison = compare(left, right)
        comparison.nil? || comparison
      end

      def compare(left, right)
        return nil if left.empty? && right.empty?

        left.each_index.map do |i|
          return false unless right && right[i]

          if left[i].class == Integer && right[i].class == Integer
            next if left[i] == right[i]
            return left[i] < right[i]
          end

          left_elem = left[i].class == Array ? left[i] : [left[i]]
          right_elem = right[i].class == Array ? right[i] : [right[i]]

          result = compare(left_elem, right_elem)
          return result unless result.nil?
        end.compact.empty?
      end
  end
end

