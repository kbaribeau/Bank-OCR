package com.kbaribeau;

import java.util.HashMap;

public class CharacterParser {
    public static int ILLEGIBLE_DIGIT = -1;
    
    private HashMap<String, Integer> charactersToDigitsMap = new HashMap<String, Integer>();

    public CharacterParser() {
        charactersToDigitsMap.put(Digits.ZERO, 0);
        charactersToDigitsMap.put(Digits.ONE, 1);
        charactersToDigitsMap.put(Digits.TWO, 2);
        charactersToDigitsMap.put(Digits.THREE, 3);
        charactersToDigitsMap.put(Digits.FOUR, 4);
        charactersToDigitsMap.put(Digits.FIVE, 5);
        charactersToDigitsMap.put(Digits.SIX, 6);
        charactersToDigitsMap.put(Digits.SEVEN, 7);
        charactersToDigitsMap.put(Digits.EIGHT, 8);
        charactersToDigitsMap.put(Digits.NINE, 9);
    }

    public int parseSingleDigit(String digit) throws UnparsableDigitException{
        Integer result = charactersToDigitsMap.get(digit);
        if (result == null) {
            throw new UnparsableDigitException("unable to parse string into digit: " + digit);
        }
        return result;
    }
}
