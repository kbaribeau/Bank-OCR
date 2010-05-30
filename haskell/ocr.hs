module Ocr where

	import Test.HUnit


	--main = do putStrLn "Hello World!"


	main = putStrLn zero

	--test1 = TestCase (assertEqual "noop test" True True)
	--main = runTestTT tests
	--tests = TestList [test1]

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
