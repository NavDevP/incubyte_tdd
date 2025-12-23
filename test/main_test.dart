import 'package:dart/main.dart';
import 'package:test/test.dart';

void main() {
  test('add', () {
    expect(add(""), 0);
    expect(add("1,2"), 3);
    expect(add("1,3\n2"), 6);
  });
}
