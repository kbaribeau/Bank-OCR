package com.kbaribeau;

@SuppressWarnings("unused") //you always implement these constructors on exceptions. see "effective java" by joshua bloch
public class UnparsableDigitException extends Exception {
    public UnparsableDigitException(String message) {
        super(message);
    }

    public UnparsableDigitException(String message, Throwable cause) {
        super(message, cause);
    }

    public UnparsableDigitException(Throwable cause) {
        super(cause);
    }
}
