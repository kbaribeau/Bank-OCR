module Ocr where

	import Test.HUnit

	recognize :: String -> Int
	recognize x | x == zero  = 0
							| x == one   = 1
							| x == two   = 2
							| x == three = 3
							| x == four  = 4
							| x == five  = 5
							| x == six   = 6
							| x == seven = 7
							| x == eight = 8
							| x == nine  = 9

	rtest0 = TestCase (assertEqual "recognize zero" (recognize zero) 0)
	rtest1 = TestCase (assertEqual "recognize one" (recognize one) 1)
	rtest2 = TestCase (assertEqual "recognize two" (recognize two) 2)
	rtest3 = TestCase (assertEqual "recognize three" (recognize three) 3)
	rtest4 = TestCase (assertEqual "recognize four" (recognize four) 4)
	rtest5 = TestCase (assertEqual "recognize five" (recognize five) 5)
	rtest6 = TestCase (assertEqual "recognize six" (recognize six) 6)
	rtest7 = TestCase (assertEqual "recognize seven" (recognize seven) 7)
	rtest8 = TestCase (assertEqual "recognize eight" (recognize eight) 8)
	rtest9 = TestCase (assertEqual "recognize nine" (recognize nine) 9)

	--split :: String -> [String]
	--split str = split2 str []

	takeFirst str result | str == [] = result
											 | otherwise = takeFirst str [x:result] where x

	tf0 = TestCase (assertEqual "" (takeFirst zero_thru_one) zero)
											

	--stest0 = TestCase (assertEqual "split zero one" (split zero_thru_one) [zero, one])
	tests = TestList [rtest0, rtest1, rtest2, rtest3, rtest4, rtest5, rtest6, rtest7, rtest8, rtest9]

	--main = runTestTT tests
	main = runTestTT TestList [tf0]

	zero_thru_one = unlines [
		" _    ",
		"| |  |",
		"|_|  |"]

	zero_one = unlines [
		" _ ", 
		"| |", 
		"|_|"] 

	zero = unlines [
		" _ ", 
		"| |", 
		"|_|"] 

	one = unlines [
		"   ", 
		"  |", 
		"  |"] 

	two = unlines [
		" _ ", 
		" _|", 
		"|_ "] 

	three = unlines [
		" _ ", 
		" _|", 
		" _|"] 

	four = unlines [
		"   ", 
		"|_|", 
		"  |"] 

	five = unlines [
		" _ ", 
		"|_ ", 
		" _|"] 

	six = unlines [
		" _ ", 
		"|_ ", 
		"|_|"] 

	seven = unlines [
		" _ ", 
		"  |", 
		"  |"] 

	eight = unlines [
		" _ ", 
		"|_|", 
		"|_|"] 

	nine = unlines [
		" _ ", 
		"|_|", 
		" _|"] 

	illegible_number = unlines [
		" _ ",
		"|_|", 
		" _ "]

	numbers_zero_thru_one  = unlines [
		" _    ",
		"| |  |", 
		"|_|  |"]

	numbers_zero_thru_two  = unlines [
		" _     _ ",
		"| |  | _|", 
		"|_|  ||_ "]

	nine_eights = unlines [
		" _  _  _  _  _  _  _  _  _ ",
		"|_||_||_||_||_||_||_||_||_|", 
		"|_||_||_||_||_||_||_||_||_|"]

	nine_nines = unlines [
		" _  _  _  _  _  _  _  _  _ ",
		"|_||_||_||_||_||_||_||_||_|", 
		" _| _| _| _| _| _| _| _| _|"]

	nine_fives = unlines [
		" _  _  _  _  _  _  _  _  _ ",
		"|_ |_ |_ |_ |_ |_ |_ |_ |_ ", 
		" _| _| _| _| _| _| _| _| _|"]

	nine_sixes = unlines [
		" _  _  _  _  _  _  _  _  _ ",
		"|_ |_ |_ |_ |_ |_ |_ |_ |_ ", 
		"|_||_||_||_||_||_||_||_||_|"]

	one_thru_nine_with_error = unlines [
		"    _  _     _  _  _  _  _ ",
		" _| _| _||_||_ |_   ||_||_|", 
		"  ||_  _|  | _||_|  ||_| _|"]

	one_thru_nine = unlines [
		"    _  _     _  _  _  _  _ ",
		"  | _| _||_||_ |_   ||_||_|", 
		"  ||_  _|  | _||_|  ||_| _|"]

	fifty_one_with_error = unlines [
		" _     _  _  _  _  _  _    ",
		"| || || || || || || ||_   |", 
		"|_||_||_||_||_||_||_| _|  |"]

	random_number_with_error = unlines [
		"    _  _  _  _  _  _     _ ",
		"|_||_|| ||_||_   |  |  | _ ", 
		"  | _||_||_||_|  |  |  | _|"]

