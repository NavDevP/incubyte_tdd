import 'package:dart/exceptions/exceptions.dart';

int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  var mainNumbersString = numbers;
  RegExp delimiter = RegExp(r'[\n,]');

  if (numbers.startsWith('//')) {
    var parts = numbers.split('\n');
    delimiter = RegExp(r'[' + parts[0].substring(2) + r']');
    mainNumbersString = parts[1];
  }

  var splitted = mainNumbersString.split(delimiter);
  var negatives = splitted.where((numStr) => int.parse(numStr) < 0).join(',');
  if (negatives.isNotEmpty) {
    throw NegativeError(negatives.split(',').map(int.parse).toList());
  }

  return mainNumbersString
      .split(delimiter)
      .map(int.parse)
      .reduce((a, b) => a + b);
}