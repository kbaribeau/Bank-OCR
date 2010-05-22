require 'lib/ocr/ocr'
require 'lib/ocr/numbers'
=begin
	time spent: 
		2 hr (1 hr messing with ruby weirdness) -- split, 
		1 hr --recognize + first pass at checksum
		.75  --checksum
		15 minutes -- typing out test cases for correct
		25 minutes -- type out algorithm for correct

=end

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
		it "an illegible number" do
			ocr.recognize(illegible_number).should == '?'
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
			[664371495, 888888888, 555555555, 666666666, 999999999,
			490067715].each do |num|
				it num.to_s do 
					ocr.checksum(num).should == false
				end
			end
		end
	end

	context "correcting scanner errors" do
		context "when there are multiple solutions" do
			xit "for 888888888" do
				ocr.correct(nine_eights).should == ['888886888', '888888880', '888888988']
			end
			xit "for 555555555" do
				ocr.correct(nine_fives).should == ['555655555', '559555555']
			end
			xit "for 666666666" do
				ocr.correct(nine_sixes).should == ['665666666', '686666666']
			end
			xit "for 999999999" do
				ocr.correct(nine_nines).should == ['899999999', '993999999', '999959999']
			end
		end

		context "when there is a single solution" do
			xit "for 123456789 with an extra -" do
				ocr.correct(one_thru_nine_with_error).should == ['123456789']
			end
			xit "for 51 with a missing _" do
				ocr.correct(fifty_one_with_error).should == ['000000051']
			end
			xit "for 490867715 with a missing |" do
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
 _       _ 
| |  |   _|
|_|  |  |_ 
END
end
def nine_eights
<<END
 _  _  _  _  _  _  _  _  _ 
|_||_||_||_||_||_||_||_||_|
|_||_||_||_||_||_||_||_||_|
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
