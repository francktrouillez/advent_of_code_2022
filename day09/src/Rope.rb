module Day09
  class Rope
    attr_accessor :knots, :markers
    def initialize(n)
      @knots = Array.new(n) { [0, 0] }
      @markers = { [0, 0] => true }
    end

    def move(travel)
      travel.map(&:abs).max.times do
        @knots.first.map!.with_index { |v, i| v + (travel[i] <=> 0) }
        @knots.each_cons(2) do |previous, current|
          next if close_enough?(previous, current)

          current.map!.with_index { |v, i| v + ((previous[i] - v) <=> 0) }
        end
        @markers[@knots.last.dup] = true
      end
    end

    private

      def close_enough?(a, b)
        a.zip(b).map { |i, j| i - j }.map { |v| v.between?(-1, 1) }.inject(&:&)
      end
  end
end
