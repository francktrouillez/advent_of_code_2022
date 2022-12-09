module Day08
  class Tree
    attr_accessor :x, :y, :z, :right, :left, :up, :down, :visible

    def initialize(x, y, z)
      @x = x
      @y = y
      @z = z
      @visible = false
    end

    def score
      left * right * up * down
    end
  end
end
