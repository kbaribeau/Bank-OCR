package com.kbaribeau;

import org.junit.Test;

import static org.junit.Assert.*;

public class CharacterRecognitionTest {

    private CharacterParser parser = new CharacterParser();

    @Test
    public void zero() throws Exception {
        assertEquals(0, parser.parseSingleDigit(Digits.ZERO));
    }

    @Test
    public void one() throws Exception {
        assertEquals(1, parser.parseSingleDigit(Digits.ONE));
    }

    @Test
    public void two() throws Exception {
        assertEquals(2, parser.parseSingleDigit(Digits.TWO));

    }

    @Test
    public void three() throws Exception {
        assertEquals(3, parser.parseSingleDigit(Digits.THREE));

    }

    @Test
    public void four() throws Exception {
        assertEquals(4, parser.parseSingleDigit(Digits.FOUR));

    }

    @Test
    public void five() throws Exception {
        assertEquals(5, parser.parseSingleDigit(Digits.FIVE));

    }

    @Test
    public void six() throws Exception {
        assertEquals(6, parser.parseSingleDigit(Digits.SIX));

    }

    @Test
    public void seven() throws Exception {
        assertEquals(7, parser.parseSingleDigit(Digits.SEVEN));

    }

    @Test
    public void eight() throws Exception {
        assertEquals(8, parser.parseSingleDigit(Digits.EIGHT));

    }

    @Test
    public void nine() throws Exception {
        assertEquals(9, parser.parseSingleDigit(Digits.NINE));

    }

    static final String ILLEGIBLE_NUMBER = 
        " _ \n" +
        "|_|\n" +
        " _ ";

    @Test(expected= UnparsableDigitException.class)
    public void illegibleNumber() throws Exception {
        parser.parseSingleDigit(ILLEGIBLE_NUMBER);

    }

}

