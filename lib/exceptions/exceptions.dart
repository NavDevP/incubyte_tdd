class NegativeError implements Exception {
  List<int> numbers;
  
  NegativeError(this.numbers);

  @override
  String toString() => 'Negatives not allowed: ${numbers.join(', ')}';
}