require_relative "./Solution"

DAY = 2

puts "========="
puts "= Day #{DAY} ="
puts "========="
puts

solution = Object.const_get("Day#{DAY}::Solution").new
solution.print_output
solution.write_output
