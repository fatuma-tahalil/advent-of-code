# Day 3 part 1
def max_battery_output()
  total_output_jolt = 0
  lines_array = File.readlines("puzzle_input_three.txt")
  for bank in lines_array
    # Get the highest numbers by ordering it in a set
    ordered_bank = bank.chars.sort.reverse
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

