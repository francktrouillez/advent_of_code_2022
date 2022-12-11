module Day11
  class Monkey
    attr_accessor :items, :number_of_operations, :test_divisor

    def initialize(monkey_strings, relief_feeling:)
      set_items(monkey_strings.shift)
      set_operation(monkey_strings.shift)
      set_test(monkey_strings)
      @number_of_operations = 0
      @operation_divisor = relief_feeling ? 3 : 1
    end

    def set_max_value(max_value)
      @max_value = max_value
    end

    def operation
      @items.map! { |i| @operation_block.call(i) / @operation_divisor % @max_value }
      @number_of_operations += items.size
    end

    def test
      @items.map { |i| (i % @test_divisor).zero? ? @test_true_monkey : @test_false_monkey }
    end

    private

      def set_items(items_string)
        @items = items_string.split("items: ").last.split(", ").map(&:to_i)
      end

      def set_operation(operation_string)
        transformation = operation_string.split(" = ").last.split[1..]
        @operation_block = Proc.new { |i| i.send(transformation.first.to_sym, transformation.last == "old" ? i : transformation.last.to_i) }
      end

      def set_test(test_strings)
        @test_divisor = test_strings.shift.split("divisible by ").last.to_i
        @test_true_monkey = test_strings.shift.split("true: throw to monkey ").last.to_i
        @test_false_monkey = test_strings.shift.split("false: throw to monkey ").last.to_i
      end
  end
end
