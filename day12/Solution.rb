require_relative "../helpers/Solution"

module Day12
  class Solution < ::Solution
    NODE_VALUES = ("a".."z").to_a

    def generate_output_1
      generate_map
      @queue = [@start_position]
      a_star
      @map[@end_position[:y]][@end_position[:x]][:cost]
    end

    def generate_output_2
      generate_map
      @queue = []
      @map.each_with_index do |r, i|
        r.each_with_index do |n, j|
          if n[:value].zero?
            n[:cost] = 0
            n[:estimated_cost] = h_cost({ x: j, y: i })
            @queue.append({ x: j, y: i })
          end
        end
      end
      a_star
      @map[@end_position[:y]][@end_position[:x]][:cost]
    end

    private

      def generate_map
        @map = input.map { |i| i.split("").map { |n| { value: NODE_VALUES.index(n) || (n == "S" ? :start : :end), cost: nil, estimated_cost: nil } } }
        @start_position = { x: @map.flatten.index { |n| n[:value] == :start } % @map.first.size, y: @map.flatten.index { |n| n[:value] == :start } / @map.first.size }
        @end_position = { x: @map.flatten.index { |n| n[:value] == :end } % @map.first.size, y: @map.flatten.index { |n| n[:value] == :end } / @map.first.size }
        @map[@start_position[:y]][@start_position[:x]] = { value: 0, cost: 0, estimated_cost: h_cost(@start_position) }
        @map[@end_position[:y]][@end_position[:x]][:value] = NODE_VALUES.size - 1
      end

      def a_star
        until @queue.empty?
          candidate = pop_candidate
          break if candidate == @end_position

          current_cost = @map[candidate[:y]][candidate[:x]][:cost] + 1
          neighbours(
            candidate[:x],
            candidate[:y]
          ).select { |n| @map[n[:y]][n[:x]][:value] <= @map[candidate[:y]][candidate[:x]][:value] + 1 }
           .each do |n|
            if !@map[n[:y]][n[:x]][:cost] || current_cost < @map[n[:y]][n[:x]][:cost]
              @map[n[:y]][n[:x]][:cost] = current_cost
              @map[n[:y]][n[:x]][:estimated_cost] = current_cost + h_cost(n)
              @queue.append(n) unless @queue.include? n
            end
           end
        end
      end


      def pop_candidate
        estimated_costs = @queue.map { |c| @map[c[:y]][c[:x]][:estimated_cost] }
        min_cost = estimated_costs.compact.min
        index = estimated_costs.index { |c| c == min_cost }
        candidate = @queue[index]
        @queue = @queue[...index] + @queue[(index + 1)..]
        candidate
      end

      def h_cost(candidate)
        (candidate[:x] - @end_position[:x]).abs + (candidate[:y] - @end_position[:y]).abs
      end

      def neighbours(x, y)
        neighbours = []
        neighbours.append({ x: x + 1, y: y }) if x + 1 < @map.first.size
        neighbours.append({ x: x - 1, y: y }) if x - 1 >= 0
        neighbours.append({ x: x, y: y + 1 }) if y + 1 < @map.size
        neighbours.append({ x: x, y: y - 1 }) if y - 1 >= 0
        neighbours
      end
  end
end

