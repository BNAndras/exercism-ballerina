import ballerina/test;

@test:Config
function testSingleDigitStringCanNotBeValid() {
    test:assertFalse(isValid("1"));
}

@test:Config {
    enable: true
}
function testASingleZeroIsInvalid() {
    test:assertFalse(isValid("0"));
}

@test:Config {
    enable: true
}
function testASimpleValidSINThatRemainsValidIfReversed() {
    test:assertTrue(isValid("059"));
}

@test:Config {
    enable: true
}
function testASimpleValidSINThatBecomesInvalidIfReversed() {
    test:assertTrue(isValid("59"));
}


@test:Config {
    enable: true
}
function testAValidCanadianSIN() {
    test:assertTrue(isValid("055 444 285"));
}

@test:Config {
    enable: true
}
function testInvalidCanadianSIN() {
    test:assertFalse(isValid("055 444 286"));
}

@test:Config {
    enable: true
}
function testInvalidCreditCard() {
    test:assertFalse(isValid("8273 1232 7352 0569"));
}

@test:Config {
    enable: true
}
function testInvalidLongNumberWithAnEvenRemainder() {
    test:assertFalse(isValid("1 2345 6789 1234 5678 9012"));
}

@test:Config {
    enable: true
}
function testInvalidLongNumberWithARemainderDivisibleBy5() {
    test:assertFalse(isValid("1 2345 6789 1234 5678 9013"));
}

@test:Config {
    enable: true
}
function testValidNumberWithAnEvenNumberOfDigits() {
    test:assertTrue(isValid("095 245 88"));
}

@test:Config {
    enable: true
}
function testValidNumberWithAnOddNumberOfSpaces() {
    test:assertTrue(isValid("234 567 891 234"));
}

@test:Config {
    enable: true
}
function testValidStringsWithANonDigitAddedAtTheEndBecomeInvalid() {
    test:assertFalse(isValid("059a"));
}

@test:Config {
    enable: true
}
function testValidStringsWithPunctuationIncludedBecomeInvalid() {
    test:assertFalse(isValid("055-444-285"));
}

@test:Config {
    enable: true
}
function testValidStringsWithSymbolsIncludedBecomeInvalid() {
    test:assertFalse(isValid("055# 444$"));
}

@test:Config {
    enable: true
}
function testSingleZeroWithSpaceIsInvalid() {
    test:assertFalse(isValid(" 0"));
}

@test:Config {
    enable: true
}
function testMoreThanASingleZeroIsValid() {
    test:assertTrue(isValid("0000 0"));
}

@test:Config {
    enable: true
}
function testInputDigit9IsCorrectlyConvertedToOutputDigit9() {
    test:assertTrue(isValid("091"));
}


@test:Config {
    enable: true
}
function testVeryLongInputIsValid() {
    test:assertTrue(isValid("9999999999 9999999999 9999999999 9999999999"));
}

@test:Config {
    enable: true
}
function testValidLuhnWithAnOddNumberOfDigitsAndNonZeroFirstDigit() {
    test:assertTrue(isValid("109"));
}

@test:Config {
    enable: true
}
function testUsingAsciiValueForNonDoubledNonDigitIsntAllowed() {
    test:assertFalse(isValid("055b 444 285"));
}

@test:Config {
    enable: true
}
function testUsingAsciiValueForDoubledNonDigitIsntAllowed() {
    test:assertFalse(isValid(":9"));
}

@test:Config {
    enable: true
}
function testNonNumericNonSpaceCharInTheMiddleWithASumThatsDivisibleBy10IsntAllowed() {
    test:assertFalse(isValid("59%59"));
}