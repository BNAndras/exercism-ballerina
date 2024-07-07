public function isValid(string value) returns boolean {
    string:RegExp x = re `\s`;
    string cleanValue = x.replaceAll(value, "");
    int len = cleanValue.length();

    int checksum = -1;
    if len > 1 && cleanValue.matches(re `^\d+$`) {
        string:Char[] digits = [];
        foreach string:Char chr in cleanValue {
            digits.push(chr);
        }
    
        int cadence = len % 2;
        foreach [int, string:Char] [i, c] in digits.enumerate() {
            int digit = checkpanic int:fromString(c);
            if i % 2 == cadence {
                digit *=  2;
                if digit > 9 {
                    digit -= 9;
                }
            }
            checksum += digit;
        }

    }

    return checksum % 10 == 0;    
}