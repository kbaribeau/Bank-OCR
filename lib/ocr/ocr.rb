class String
	def replace_at(index, char)
		result = String.new(self)
		result[index] = char
		result
	end
end

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
		dict = {
				Numbers.zero => 0,
				Numbers.one => 1,
				Numbers.two => 2,
				Numbers.three => 3,
				Numbers.four => 4,
				Numbers.five => 5,
				Numbers.six => 6,
				Numbers.seven => 7,
				Numbers.eight => 8,
				Numbers.nine => 9
		}

		dict[number] == nil ? '?' : dict[number]
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
				errors << input.replace_at(index, "|")
				errors << input.replace_at(index, "_")
			end

			errors << input.replace_at(index, " ") if current_char == "|"
			errors << input.replace_at(index, " ") if current_char == "_"
		end
		errors
	end
end
