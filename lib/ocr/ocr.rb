class Ocr 
	def split(numbers)
		lines = numbers.split("\n")
		size = (lines[0].length / 4.0).ceil
		split_numbers = []
		size.times { split_numbers << "" }

		lines.each_with_index do |line, index|
			line_index = 0
			split_numbers.each do |split_num|
				split_num << line.slice(line_index, 3) << "\n" 
				line_index += 4
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
	end

	def checksum(number) 
		checksum = 0
		digit_list = number.to_s.chars.to_a.map {|x| x.to_i}
		digit_list.insert(0, 0) while digit_list.length < 9
		digit_list = digit_list.reverse

		#checksum = checksum.inject_with_index(0) {|x, y, i} x + y * (i+1)}
		(1..9).to_a.each do |index| 
			checksum += (digit_list[index-1] * (index))
		end

		checksum % 11 == 0
	end
end
