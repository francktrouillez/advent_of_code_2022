module Day10
  class CRT
    HEIGHT = 6
    WIDTH = 40

    def initialize
      @pixels = []
    end

    def add_pixel(x, cycle)
      @pixels.append(((cycle % WIDTH)- x).between?(-1, 1) ? "#" : ".")
    end

    def output
      HEIGHT.times.map { |y| @pixels[(WIDTH * y)...(WIDTH * (y + 1))].join("") }.join("\n")
    end
  end
end
