require 'lib/ocr/ocr'
require 'lib/ocr/numbers'
#time spent: 2 hr (1 hr messing with ruby weirdness), + 1 hr

describe Ocr do
	ocr = Ocr.new
	context "splitting" do
		it "two boxed numbers" do
			ocr.split(numbers_zero_thru_one).should == [Numbers.zero, Numbers.one]
		end
		it "three boxed numbers" do
			ocr.split(numbers_zero_thru_two).should == [Numbers.zero, Numbers.one, Numbers.two]
		end
	end

	context "recognizing" do
		it "a zero" do
			ocr.recognize(Numbers.zero).should == 0
		end
		it "a one" do
			ocr.recognize(Numbers.one).should == 1
		end
		it "a two" do
			ocr.recognize(Numbers.two).should == 2
		end
		it "a three" do
			ocr.recognize(Numbers.three).should == 3
		end
		it "a four" do
			ocr.recognize(Numbers.four).should == 4
		end
		it "a five" do
			ocr.recognize(Numbers.five).should == 5
		end
		it "a six" do
			ocr.recognize(Numbers.six).should == 6
		end
		it "a seven" do
			ocr.recognize(Numbers.seven).should == 7
		end
		it "a eight" do
			ocr.recognize(Numbers.eight).should == 8
		end
		it "a nine" do
			ocr.recognize(Numbers.nine).should == 9
		end
	end

	context "checksumming" do
		context "true case" do
			[51, 123456789, 200800000, 333393333, 490067115, 490067719,
			490867715, 490867715, 555655555, 559555555, 666566666, 686666666,
			711111111, 777777177, 888886888, 888888880, 888888988, 899999999,
			993999999, 999959999].each do |num|
				it num.to_s do
					ocr.checksum(num).should == true
				end
			end
		end

		context "false case" do
			[664371495].each do |num|
				it num.to_s do 
					ocr.checksum(num).should == false
				end
			end
		end
	end

def numbers_zero_thru_one 
<<END 
 _     
| |  | 
|_|  | 
END
end
def numbers_zero_thru_two 
<<END
 _       _ 
| |  |   _|
|_|  |  |_ 

END
end
end
