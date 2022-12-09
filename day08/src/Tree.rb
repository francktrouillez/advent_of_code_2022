module Day08
  class Tree
    attr_accessor :height, :visible, :views

    def initialize(height)
      @height = height
      @visible = false
      @views = []
    end

    def score
      @views.inject(&:*)
    end
  end
end
