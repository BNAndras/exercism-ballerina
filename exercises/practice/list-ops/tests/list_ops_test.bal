import ballerina/test;

@test:Config
function testAppendEmptyLists() {
    int[] list1 = [];
    int[] list2 = [];
    int[] result = append(list1, list2);
    int[] expected = [];

    test:assertEquals(result, expected);
}

@test:Config {
    enable: false
}
function testAppendListToEmptyList() {
    int[] list1 = [];
    int[] list2 = [1, 2, 3, 4];
    int[] result = append(list1, list2);
    int[] expected = [1, 2, 3, 4];

    test:assertEquals(result, expected);
}

@test:Config {
    enable: false
}
function testAppendEmptyListToList() {
    int[] list1 = [1, 2, 3, 4];
    int[] list2 = [];
    int[] result = append(list1, list2);
    int[] expected = [1, 2, 3, 4];

    test:assertEquals(result, expected);
}

@test:Config {
    enable: false
}
function testAppendNonEmptyLists() {
    int[] list1 = [1, 2];
    int[] list2 = [2, 3, 4, 5];
    int[] result = append(list1, list2);
    int[] expected = [1, 2, 2, 3, 4, 5];

    test:assertEquals(result, expected);
}

@test:Config {
    enable: false
}
function testConcatenateEmptyList() {
    ConcatenableList lists = <int[]> [];
    ConcatenatedList result = concat(lists);
    ConcatenatedList expected = <int[]> [];

    test:assertEquals(result, expected);
}

@test:Config {
    enable: false
}
function testConcatenateListOfLists() {
    ConcatenableList lists = [[1, 2], [3], [], [4, 5, 6]];
    ConcatenatedList result = concat(lists);
    ConcatenatedList expected = [1, 2, 3, 4, 5];

    test:assertEquals(result, expected);
}

@test:Config {
    enable: false
}
function testConcatenateListOfNestedLists() {
    ConcatenableList lists = [[[1], [2]], [[3]], [[]], [[4, 5, 6]]]
    ConcatenatedList result = concat(lists);
    ConcatenatedList expected = [[1], [2], [3], [], [4, 5, 6]];

    test:assertEquals(result, expected);
}

@test:Config {
    enable: false
}
function testFilterEmptyList() {
    int[] list = [];
    var f = function(int x) returns boolean {
        return x % 2 == 1;
    };
    int[] result = filter(list, f);
    int[] expected = [];

    test:assertEquals(result, expected);
}

@test:Config {
    enable: false
}
function testFilterNonEmptyList() {
    int[] list = [1, 2, 3, 5];
    var f = function(int x) returns boolean {
        return x % 2 == 1;
    };
    int[] result = filter(list, f);
    int[] expected = [1, 3, 5];

    test:assertEquals(result, expected);
}

