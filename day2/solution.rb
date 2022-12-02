require_relative "./Solution"

DAY = 2

solution = Object.const_get("Day#{DAY}::Solution").new(DAY)
solution.print_output
solution.write_output
