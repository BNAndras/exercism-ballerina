import ballerina/test;

@test:Config
function testZeroRows() {
    int[][] expected = [];
    test:assertEquals(expected, rows(0));
}

@test:Config {
    enable: false
}
function testSingleRow() {
    int[][] expected = [[1]];
    test:assertEquals(expected, rows(1));
}

@test:Config {
    enable: false
}
function testTwoRows() {
    int[][] expected = [[1],
                        [1, 1]];
    test:assertEquals(expected, rows(2));
}   

@test:Config {
    enable: false
}
function testThreeRows() {
    int[][] expected = [[1],
                        [1, 1],
                        [1, 2, 1]];
    test:assertEquals(expected, rows(3));
}

@test:Config {
    enable: false
}
function testFourRows() {
    int[][] expected = [[1],
                        [1, 1],
                        [1, 2, 1],
                        [1, 3, 3, 1]];
    test:assertEquals(expected, rows(4));
}

@test:Config {
    enable: false
}
function testFiveRows() {
    int[][] expected = [[1],
                        [1, 1],
                        [1, 2, 1],
                        [1, 3, 3, 1],
                        [1, 4, 6, 4, 1]];
    test:assertEquals(expected, rows(5));
}

@test:Config {
    enable: false
}
function testSixRows() {
    int[][] expected = [[1],
                        [1, 1],
                        [1, 2, 1],
                        [1, 3, 3, 1],
                        [1, 4, 6, 4, 1],
                        [1, 5, 10, 10, 5, 1]];
    test:assertEquals(expected, rows(6));
}

@test:Config {
    enable: false
}
function testTenRows() {
    int[][] expected = [[1],
                        [1, 1],
                        [1, 2, 1],
                        [1, 3, 3, 1],
                        [1, 4, 6, 4, 1],
                        [1, 5, 10, 10, 5, 1],
                        [1, 6, 15, 20, 15, 6, 1],
                        [1, 7, 21, 35, 35, 21, 7, 1],
                        [1, 8, 28, 56, 70, 56, 28, 8, 1],
                        [1, 9, 36, 84, 126, 126, 84, 36, 9, 1]];
    test:assertEquals(expected, rows(10));
}