require_relative "../helpers/Solution"
require_relative "./Tree"

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

    def generate_grid
      return if @grid

      @grid = input.map.with_index do |row, y|
        row.split("").map.with_index { |z, x| Tree.new(x, y, z.to_i) }
      end

      @grid.each do |row|
        row.each do |tree|
          tree.left = if (view = row[0...tree.x].reverse.index { |t| t.z >= tree.z })
            view + 1
          else
            tree.visible = true
            tree.x
          end

          tree.right = if (view = row[(tree.x + 1)..-1].index { |t| t.z >= tree.z })
            view + 1
          else
            tree.visible = true
            row.size - tree.x - 1
          end
        end
      end

      @grid.first.size.times do |x|
        @grid.each do |row|
          tree = row[x]
          tree.up = if (view = (0...tree.y).to_a.reverse.index { |y| @grid[y][x].z >= tree.z })
            view + 1
          else
            tree.visible = true
            tree.y
          end

          tree.down = if (view = ((tree.y + 1)...@grid.size).to_a.index { |y| @grid[y][x].z >= tree.z })
            view + 1
          else
            tree.visible = true
            @grid.size - tree.y - 1
          end
        end
      end
    end
  end
end

