int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  RegExp delimiter = RegExp(r'[\n,]');

  return numbers
      .split(delimiter)
      .map(int.parse)
      .reduce((a, b) => a + b);
}
