require_relative "../helpers/Solution"

module Day07
  class Solution < ::Solution
    def generate_output_1
      generate_tree
      generate_size(@tree)
      @sizes.values.select { |s| s <= 100_000 }.sum
    end

    def generate_output_2
      generate_tree
      generate_size(@tree)
      @sizes.values.select { |s| @sizes["/"] <= 40_000_000 + s }.min
    end

    private

      def generate_tree
        return if @tree

        @tree = {}
        @sizes = {}
        @current_directory = {}
        @current_directory_path = []
        input.reject { |i| i.start_with? /($ ls|dir)/ }.each do |i|
          next cd(i[2..].split.last) if i.start_with? "$ cd"

          file_size, file = i.split
          @current_directory[file] = file_size.to_i
        end
      end

      def generate_size(subtree, path = "/")
        @sizes[path] ||= subtree.reduce(0) do |acc, (k, v)|
          current_path = "#{path}#{k}/"
          acc + (v.is_a?(Hash) ? generate_size(v, current_path) : v)
        end
      end

      def cd(arg)
        case arg
        when "/"
          @current_directory_path = []
        when ".."
          @current_directory_path.pop
        else
          @current_directory_path.append(arg)
        end
        @current_directory = @current_directory_path.reduce(@tree) { |acc, dir| acc[dir] ||= {} }
      end
  end
end

