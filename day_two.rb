# repeating values ex. 55
# NO leading 0s

def invalid_ids
  sum = 0
  File.open("puzzle_input_two.txt", "r") do |file_handle|
    file_handle.each_line do |line|
      num = line.to_s.split("-")

      start, last = num[0].to_i, num[1].to_i

      if start.to_s.length > 0 # So that we aren't deaing with numbers 0-9

        for number in (start..last)
          pattern, str_num = "", number.to_s

          str_num.each_char do |char|
            pattern << char
            if pattern_true(pattern, str_num)
              puts number
              sum += number
              break
            end
          end

        end
      end

    end
  end
  return sum
end

def pattern_true(pattern, str_num)
  # Pattern must not be the whole string
  if pattern == str_num
    return false
  end
  # Pattern must be able to fit in the string
  if (str_num.length)%(pattern.length) != 0
    return false
  end
  # Pattern must consist of every section of the string
  len_pattern = pattern.length
  str_num.scan(/.{1,#{len_pattern}}/) do |section|
    if section != pattern
      return false
    end
  end
  return true
end


puts "Answer: #{invalid_ids}"
