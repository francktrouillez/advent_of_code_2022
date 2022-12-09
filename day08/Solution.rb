require_relative "../helpers/Solution"

require_relative "./src/Tree"

module Day08
  class Solution < ::Solution
    def generate_output_1
      generate_grid
      @grid.flatten.select(&:visible).size
    end

    def generate_output_2
      generate_grid
      @grid.flatten.map(&:score).max
    end

    private

      def generate_grid
        @grid ||= 4.times.reduce(input.map { |i| i.split("").map { |h| Tree.new(h.to_i) } }) do |acc, i|
          rotated_grid(acc).each do |row|
            row.each_with_index do |tree, j|
              tree.views.append(row[(j+1)..-1].index { |t| t.height >= tree.height })
              tree.visible ||= !tree.views.last
              tree.views[-1] = tree.views.last ? tree.views.last + 1 : (row.size - j - 1)
            end
          end
        end
      end

      def rotated_grid(grid)
        grid.transpose.map(&:reverse)
      end
  end
end

