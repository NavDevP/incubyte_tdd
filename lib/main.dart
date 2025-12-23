import 'package:dart/exceptions/exceptions.dart';

const maximumNumber = 1000;

int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  var mainNumbersString = numbers;
  var delimiter = ['\n',','];

  try {
    if (numbers.startsWith('//')) {
      final index = numbers.indexOf('\n');
      final firstPart = numbers.substring(2, index);
      mainNumbersString = numbers.substring(index + 1);

      final delMatches = RegExp(r'\[(.*?)\]').allMatches(firstPart);
      if (delMatches.isNotEmpty) {
        delimiter = delMatches.map((m) => m.group(1)!).toList();
      } else {
        delimiter = [firstPart];
      }
    }

    final escaped = delimiter.map(RegExp.escape).toList();
    final delimiterFilter = RegExp('(${escaped.map((d) => '$d+').join('|')})');

    var splitted = mainNumbersString.split(delimiterFilter);
    var negatives = splitted.where((numStr) => int.parse(numStr) < 0).join(',');
    if (negatives.isNotEmpty) {
      throw NegativeError(negatives.split(',').map(int.parse).toList());
    }

    return mainNumbersString
        .split(delimiterFilter)
        .map(int.parse)
        .fold(0, (main, n) => main + (n <= maximumNumber ? n : 0));
  } catch (e) {
    if (e is NegativeError) rethrow;
    throw Exception('Invalid Numbers String');
  }
}