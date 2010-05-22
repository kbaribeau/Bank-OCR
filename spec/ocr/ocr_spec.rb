require 'lib/ocr/ocr'
require 'lib/ocr/numbers'
=begin
	time spent: 
		2 hr (1 hr messing with ruby weirdness) -- split, 
		1 hr --recognize + first pass at checksum
		.75  --checksum
		2 hours 15 -- correct

		TOTAL: ~6 hours

		got burned by...
			map vs map! (lost ~30 mins)

			this weird thing (lost ~60 mins)
			irb(main):089:0> a = ["a"]*3
			=> ["a", "a", "a"]
			irb(main):090:0> a[0] << "a"
			=> "aa"
			irb(main):091:0> a
			=> ["aa", "aa", "aa"]
			irb(main):092:0> 

=end

describe Ocr do
	ocr = Ocr.new
	context "should split" do
		it "two boxed numbers" do
			ocr.split(numbers_zero_thru_one).should == [Numbers.zero, Numbers.one]
		end
		it "three boxed numbers" do
			ocr.split(numbers_zero_thru_two).should == [Numbers.zero, Numbers.one, Numbers.two]
		end
		it "nine boxed numbers" do
			ocr.split(one_thru_nine).should == [Numbers.one,
				Numbers.two, Numbers.three, Numbers.four, Numbers.five, Numbers.six,
				Numbers.seven, Numbers.eight, Numbers.nine]
		end
	end

	context "should recognize" do
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
		it "an illegible number" do
			ocr.recognize(illegible_number).should == '?'
		end
	end

	context "should calculate a checksum for the " do
		context "valid case" do
			[51, 123456789, 200800000, 333393333, 490067115, 490067719,
			490867715, 490867715, 555655555, 559555555, 666566666, 686666666,
			711111111, 777777177, 888886888, 888888880, 888888988, 899999999,
			993999999, 999959999].each do |num|
				it num.to_s do
					ocr.checksum(num).should == true
				end
			end
		end

		context "invalid case" do
			[664371495, 888888888, 555555555, 666666666, 999999999,
			490067715].each do |num|
				it num.to_s do 
					ocr.checksum(num).should == false
				end
			end
		end
	end

	context "should correct scanner errors" do
		context "when there are multiple solutions" do
			it "for 888888888" do
				ocr.correct(nine_eights).should == ['888886888', '888888880', '888888988']
			end
			it "for 555555555" do
				ocr.correct(nine_fives).should == ['559555555', '555655555']
			end
			it "for 666666666" do
				ocr.correct(nine_sixes).should == ['686666666', '666566666']
			end
			it "for 999999999" do
				ocr.correct(nine_nines).should == ['993999999', '999959999', '899999999']
			end
		end

		context "when there is a single solution" do
			it "for 123456789 with an extra -" do
				ocr.correct(one_thru_nine_with_error).should == ['123456789']
			end
			it "for 51 with a missing _" do
				ocr.correct(fifty_one_with_error).should == ['000000051']
			end
			it "for 490867715 with a missing |" do
				ocr.correct(random_number_with_error).should == ['490867715']
			end
		end

	end

def illegible_number
<<END
 _ 
|_|
 _ 
END
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
 _     _ 
| |  | _|
|_|  ||_ 
END
end
def nine_eights
<<END
 _  _  _  _  _  _  _  _  _ 
|_||_||_||_||_||_||_||_||_|
|_||_||_||_||_||_||_||_||_|
END
end
def nine_nines
<<END
 _  _  _  _  _  _  _  _  _ 
|_||_||_||_||_||_||_||_||_|
 _| _| _| _| _| _| _| _| _|
END
end
def nine_fives
<<END
 _  _  _  _  _  _  _  _  _ 
|_ |_ |_ |_ |_ |_ |_ |_ |_ 
 _| _| _| _| _| _| _| _| _|
END
end
def nine_sixes
<<END
 _  _  _  _  _  _  _  _  _ 
|_ |_ |_ |_ |_ |_ |_ |_ |_ 
|_||_||_||_||_||_||_||_||_|
END
end
def one_thru_nine_with_error
<<END
    _  _     _  _  _  _  _ 
 _| _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _|
END
end
def one_thru_nine
<<END
    _  _     _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _|
END
end
def fifty_one_with_error
<<END
 _     _  _  _  _  _  _    
| || || || || || || ||_   |
|_||_||_||_||_||_||_| _|  |
END
end
def random_number_with_error
<<END
    _  _  _  _  _  _     _ 
|_||_|| ||_||_   |  |  | _ 
  | _||_||_||_|  |  |  | _|
END
end
end
