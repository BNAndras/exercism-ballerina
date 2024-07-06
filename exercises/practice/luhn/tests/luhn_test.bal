import ballerina/test;

@test:Config
function testSingleDigitStringCanNotBeValid() {
    test:assertFalse(isValid("1"));
}

@test:Config {
    enable: false
}
function testASingleZeroIsInvalid() {
    test:assertFalse(isValid("0"));
}

@test:Config {
    enable: false
}
function testASimpleValidSINThatRemainsValidIfReversed() {
    test:assertTrue(isValid("059"));
}

@test:Config {
    enable: false
}
function testASimpleValidSINThatBecomesInvalidIfReversed() {
    test:assertTrue(isValid("59"));
}


@test:Config {
    enable: false
}
function testAValidCanadianSIN() {
    test:assertTrue(isValid("055 444 285"));
}

@test:Config {
    enable: false
}
function testInvalidCanadianSIN() {
    test:assertFalse(isValid("055 444 286"));
}

@test:Config {
    enable: false
}
function testInvalidCreditCard() {
    test:assertFalse(isValid("8273 1232 7352 0569"));
}

@test:Config {
    enable: false
}
function testInvalidLongNumberWithAnEvenRemainder() {
    test:assertFalse(isValid("1 2345 6789 1234 5678 9012"));
}

@test:Config {
    enable: false
}
function testInvalidLongNumberWithARemainderDivisibleBy5() {
    test:assertFalse(isValid("1 2345 6789 1234 5678 9013"));
}

@test:Config {
    enable: false
}
function testValidNumberWithAnEvenNumberOfDigits() {
    test:assertTrue(isValid("095 245 88"));
}

@test:Config {
    enable: false
}
function testValidNumberWithAnOddNumberOfSpaces() {
    test:assertTrue(isValid("234 567 891 234"));
}

@test:Config {
    enable: false
}
function testValidStringsWithANonDigitAddedAtTheEndBecomeInvalid() {
    test:assertFalse(isValid("059a"));
}

@test:Config {
    enable: false
}
function testValidStringsWithPunctuationIncludedBecomeInvalid() {
    test:assertFalse(isValid("055-444-285"));
}

@test:Config {
    enable: false
}
function testValidStringsWithSymbolsIncludedBecomeInvalid() {
    test:assertFalse(isValid("055# 444$"));
}

@test:Config {
    enable: false
}
function testSingleZeroWithSpaceIsInvalid() {
    test:assertFalse(isValid(" 0"));
}

@test:Config {
    enable: false
}
function testMoreThanASingleZeroIsValid() {
    test:assertTrue(isValid("0000 0"));
}

@test:Config {
    enable: false
}
function testInputDigit9IsCorrectlyConvertedToOutputDigit9() {
    test:assertTrue(isValid("091"));
}


@test:Config {
    enable: false
}
function testVeryLongInputIsValid() {
    test:assertTrue(isValid("9999999999 9999999999 9999999999 9999999999"));
}

@test:Config {
    enable: false
}
function testValidLuhnWithAnOddNumberOfDigitsAndNonZeroFirstDigit() {
    test:assertTrue(isValid("109"));
}

@test:Config {
    enable: false
}
function testUsingAsciiValueForNonDoubledNonDigitIsntAllowed() {
    test:assertFalse(isValid("055b 444 285"));
}

@test:Config {
    enable: false
}
function testUsingAsciiValueForDoubledNonDigitIsntAllowed() {
    test:assertFalse(isValid(":9"));
}

@test:Config {
    enable: false
}
function testNonNumericNonSpaceCharInTheMiddleWithASumThatsDivisibleBy10IsntAllowed() {
    test:assertFalse(isValid("59%59"));
}