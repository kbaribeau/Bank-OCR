package com.kbaribeau;

import org.junit.Test;

public class MultiCharacterRecognitionTest {

    public static final String NUMBERS_ZERO_THRU_ONE  =
        " _    \n" +
        "| |  |\n" +
        "|_|  |";

    public static final String NUMBERS_ZERO_THRU_TWO  =
        " _     _ \n" +
        "| |  | _|\n" +
        "|_|  ||_ ";
    public static final String NINE_EIGHTS =
        " _  _  _  _  _  _  _  _  _ \n" +
        "|_||_||_||_||_||_||_||_||_|\n" +
        "|_||_||_||_||_||_||_||_||_|";
    public static final String NINE_NINES =
        " _  _  _  _  _  _  _  _  _ \n" +
        "|_||_||_||_||_||_||_||_||_|\n" +
        " _| _| _| _| _| _| _| _| _|";
    public static final String NINE_FIVES =
        " _  _  _  _  _  _  _  _  _ \n" +
        "|_ |_ |_ |_ |_ |_ |_ |_ |_ \n" +
        " _| _| _| _| _| _| _| _| _|";
    public static final String NINE_SIXES =
        " _  _  _  _  _  _  _  _  _ \n" +
        "|_ |_ |_ |_ |_ |_ |_ |_ |_ \n" +
        "|_||_||_||_||_||_||_||_||_|";
    public static final String ONE_THRU_NINE_WITH_ERROR =
        "    _  _     _  _  _  _  _ \n" +
        " _| _| _||_||_ |_   ||_||_|\n" +
        "  ||_  _|  | _||_|  ||_| _|";
    public static final String ONE_THRU_NINE =
        "    _  _     _  _  _  _  _ \n" +
        "  | _| _||_||_ |_   ||_||_|\n" +
        "  ||_  _|  | _||_|  ||_| _|";
    public static final String FIFTY_ONE_WITH_ERROR =
        " _     _  _  _  _  _  _    \n" +
        "| || || || || || || ||_   |\n" +
        "|_||_||_||_||_||_||_| _|  |";
    public static final String RANDOM_NUMBER_WITH_ERROR =
        "    _  _  _  _  _  _     _ \n" +
        "|_||_|| ||_||_   |  |  | _ \n" +
        "  | _||_||_||_|  |  |  | _|";

    
}
