def change_rotation()
  start = 50
  count = 0
  File.open('./puzzle_input.txt', "r") do |file_handle|
    file_handle.each_line do |line|
      turn = line[0]
      if start == 0
        count += 1
      end
      if turn == "R"
        start = start + line[1..].to_i
      elsif turn == "L"
        start = start - line[1..].to_i
      end
      start %= 100
    end
  end
  return count
end

puts change_rotation
