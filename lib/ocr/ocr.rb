class Ocr 
	def split(numbers)
		lines = numbers.split("\n")
		size = (lines[0].length / 3.0).ceil
		split_numbers = []
		size.times { split_numbers << "" }

		lines.each_with_index do |line, index|
			line_index = 0
			split_numbers.each do |split_num|
				split_num << line.slice(line_index, 3) << "\n" 
				line_index += 3
			end
		end
		split_numbers
	end

	def recognize(number)
		lines = number.split("\n")
		dict = {
				0 => Numbers.zero,
				1 => Numbers.one,
				2 => Numbers.two,
				3 => Numbers.three,
				4 => Numbers.four,
				5 => Numbers.five,
				6 => Numbers.six,
				7 => Numbers.seven,
				8 => Numbers.eight,
				9 => Numbers.nine
		}

		dict.keys.each do |key| 
			return key if dict[key].eql? number
		end
		'?'
	end

	def checksum(number) 
		checksum = 0
		digit_list = number.to_s.chars.map {|x| x.to_i}
		digit_list.insert(0, 0) while digit_list.length < 9
		digit_list = digit_list.reverse

		#checksum = checksum.inject_with_index(0) {|x, y, i| x + y * (i+1)}
		(1..9).each do |index| 
			checksum += (digit_list[index-1] * (index))
		end

		checksum % 11 == 0
	end

	def correct(input)
		errors = find_all_possible_scanner_errors(input)
		errors.map! do |error| 
			split(error).map {|num| recognize(num).to_s}.join
		end
		errors.find_all do |x| 
			checksum(x.to_i) unless x.include?("?")
		end.to_a
	end

	def find_all_possible_scanner_errors(input) 
		errors = []
		(0..input.length-1).each do |index|
			current_char = input[index].chr
			if current_char == " " then
				errors << string_replace_at(input, index, "|")
				errors << string_replace_at(input, index, "_")
			end

			errors << string_replace_at(input, index, " ") if current_char == "|"
			errors << string_replace_at(input, index, " ") if current_char == "_"
		end
		errors
	end

	def string_replace_at(str, index, char)
		result = String.new(str)
		result[index] = char
		result
	end
end
