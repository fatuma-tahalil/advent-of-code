# repeating values ex. 55
# NO leading 0s

def invalid_ids
  sum = 0
  File.open("puzzle_input_two.txt", "r") do |file_handle|
    file_handle.each_line do |line|
      num = line.to_s.split("-")

      start = num[0].to_i
      last = num[1].to_i

      if start.to_s.length.even? || last.to_s.length.even?
        for i in (start..last)
          length = i.to_s.length
          if length.even?
            if i.to_s[..(length/2)-1] == i.to_s[(length/2)..]
              sum += i
            end
          end
        end
      end

    end
  end
  return sum
end

puts invalid_ids
