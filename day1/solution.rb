require_relative "./Solution"

DAY = 1

solution = Object.const_get("Day#{DAY}::Solution").new(DAY)
solution.print_output
solution.write_output
