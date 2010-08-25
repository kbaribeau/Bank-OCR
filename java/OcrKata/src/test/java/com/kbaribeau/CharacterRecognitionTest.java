package com.kbaribeau;

import org.junit.Test;

import static org.junit.Assert.*;

public class CharacterRecognitionTest {

    private CharacterParser parser = new CharacterParser();

    @Test
    public void zero() {
        assertEquals(0, parser.parseSingleDigit(Digits.ZERO));
    }

    @Test
    public void one() {
        assertEquals(1, parser.parseSingleDigit(Digits.ONE));
    }

    @Test
    public void two() {
        assertEquals(2, parser.parseSingleDigit(Digits.TWO));

    }

    @Test
    public void three() {
        assertEquals(3, parser.parseSingleDigit(Digits.THREE));

    }

    @Test
    public void four() {
        assertEquals(4, parser.parseSingleDigit(Digits.FOUR));

    }

    @Test
    public void five() {
        assertEquals(5, parser.parseSingleDigit(Digits.FIVE));

    }

    @Test
    public void six() {
        assertEquals(6, parser.parseSingleDigit(Digits.SIX));

    }

    @Test
    public void seven() {
        assertEquals(7, parser.parseSingleDigit(Digits.SEVEN));

    }

    @Test
    public void eight() {
        assertEquals(8, parser.parseSingleDigit(Digits.EIGHT));

    }

    @Test
    public void nine() {
        assertEquals(9, parser.parseSingleDigit(Digits.NINE));

    }

    static final String ILLEGIBLE_NUMBER = 
        " _ \n" +
        "|_|\n" +
        " _ ";

    @Test(expected= UnparsableDigitException.class)
    public void illegibleNumber() {
        parser.parseSingleDigit(ILLEGIBLE_NUMBER);

    }

}

