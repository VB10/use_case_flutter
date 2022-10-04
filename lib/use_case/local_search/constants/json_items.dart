class JsonItems {
  JsonItems._();

  /// This is a sample large data about services
  static final String largeJsonPath = '10k.json'.path;
}

extension on String {
  String get path {
    return 'assets/json/$this';
  }
}
