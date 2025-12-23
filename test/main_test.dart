import 'package:dart/exceptions/exceptions.dart';
import 'package:dart/main.dart';
import 'package:test/test.dart';

void main() {
  test('add', () {
    expect(add(""), 0, reason: "empty string should return 0");
    expect(add("1,2"), 3, reason: "two numbers comma seperated should return their sum");
    expect(add("1,3\n2"), 6, reason: "two numbers new line delimited should return their sum");
    expect(add("//;\n1;2"), 3, reason: "support different delimiters");
    expect(add("//~\n1~2~50"), 53, reason: "different delimiter ~ should return their sum");
    expect(add("//&\n1&2&2"), 5, reason: "different delimiter & should return their sum");
    expect(() => add("1,-2,3"), throwsA(isA<NegativeError>()), reason: "negative numbers not allowed, should throw an exception");
    expect(() => add("//&\n1&-2&3"), throwsA(isA<NegativeError>()), reason: "negative numbers not allowed, should throw an exception");
    expect(() => add("//&\n1&-2&-3&-4&5"), throwsA(isA<NegativeError>()), reason: "negative numbers not allowed, should throw an exception");
    expect(add("2,1001,3"), 5, reason: "1001 is greater than 1000 so it should be ignored");
    expect(add("1020,4,3"), 7, reason: "1020 is greater than 1000 so it should be ignored");
    expect(add("1020,1001,8888"), 0, reason: "all numbers greater than 1000 so they should be ignored, output 0");
    expect(add("2,1000,3"), 1005, reason: "number is not greater than 1000 so the sum includes it");
    expect(add("//[**]\n1**5**3"), 9, reason: "** custom delimiter of any length should work");
    expect(add("//[####]\n1####5####3"), 9, reason: "#### custom delimiter of any length should work");
  });
}
