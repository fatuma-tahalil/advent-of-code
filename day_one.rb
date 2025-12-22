def change_rotation()
  start = 50
  count = 0
  File.open('puzzle_input_one.txt', "r") do |file_handle|
    file_handle.each_line do |raw|
      line = raw.strip

      turn = line[0]
      step = line[1..].to_i

      previous_value = start
      if turn == "R"
        start += step
      elsif turn == "L"
        start -= step
      end

      lo = [previous_value, start].min
      hi = [previous_value, start].max

      interior = (hi - 1).div(100) - lo.div(100)
      endpoint = (start != previous_value && start % 100 == 0) ? 1 : 0

      count += interior + endpoint
    end
  end
  return count
end

puts change_rotation
