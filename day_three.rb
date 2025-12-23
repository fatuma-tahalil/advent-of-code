require "pry"
# Day 3 part 1
def max_battery_output_for_two
  total_output_jolt = 0
  lines_array = File.readlines("puzzle_input_three.txt")
  for bank in lines_array
    # Get the highest numbers by ordering it in a set
    ordered_bank = bank.chars.sort.reverse.uniq
    # Find the position of the largest number
    index_of_largest_num = bank.index(ordered_bank[0])

    # If the largest number is the last number
    if index_of_largest_num == (bank.length - 2)
      num = (ordered_bank[1] + ordered_bank[0]).to_i
    else
      # we must now look for the second largest number behind the largest number
      second_highest_num = bank[(index_of_largest_num + 1)..].chars.sort.reverse[0]
      num = (ordered_bank[0] + second_highest_num).to_i
    end
    puts num
    total_output_jolt += num
  end
  return total_output_jolt
end

# Day 3 part 2
def max_battery_output_for_twelve
  total_output_jolt = 0
  File.readlines("puzzle_input_three.txt").each do |line|
    digits = line.strip.chars
    keep = 12
    stack = []
    to_remove = digits.size - keep

    digits.each do |digit|
      while to_remove > 0 && !stack.empty? && stack[-1] < digit
        stack.pop
        to_remove -= 1
      end
      stack << digit
    end

    # Only keep the first 12 digits in case we didn't remove enough
    result = stack[0, keep].join
    total_output_jolt += result.to_i
  end
  total_output_jolt
end

puts max_battery_output_for_twelve
