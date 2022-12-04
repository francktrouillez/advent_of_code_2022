require_relative "./Solution"

DAY = "03"

puts "=============="
puts "=== Day #{DAY} ==="
puts "=============="
puts

puts "## Testing ##"
test_solution = Object.const_get("Day#{DAY}::Solution").new(test: true)
puts "- Expected -"
expected_output = File.readlines("test/output.txt").map(&:strip).join("\n")
puts expected_output
puts "-- Actual --"
test_solution.print_output
puts "-- Assert --"
test_ok = expected_output == test_solution.output.strip
puts test_ok ? "   - OK -   " : " - NOT OK - "
puts "#############"
exit unless test_ok
puts
puts "# Processing #"
solution = Object.const_get("Day#{DAY}::Solution").new
solution.print_output
solution.write_output
puts "##############"

