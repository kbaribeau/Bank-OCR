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

	test0 = TestCase (assertEqual "recognize zero" (recognize zero) 0)
	test1 = TestCase (assertEqual "recognize one" (recognize one) 1)
	test2 = TestCase (assertEqual "recognize two" (recognize two) 2)
	test3 = TestCase (assertEqual "recognize three" (recognize three) 3)
	test4 = TestCase (assertEqual "recognize four" (recognize four) 4)
	test5 = TestCase (assertEqual "recognize five" (recognize five) 5)
	test6 = TestCase (assertEqual "recognize six" (recognize six) 6)
	test7 = TestCase (assertEqual "recognize seven" (recognize seven) 7)
	test8 = TestCase (assertEqual "recognize eight" (recognize eight) 8)
	test9 = TestCase (assertEqual "recognize nine" (recognize nine) 9)
	tests = TestList [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9]

	main = runTestTT tests

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

