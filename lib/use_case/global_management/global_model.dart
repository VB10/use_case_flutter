class GlobalModel {
  const GlobalModel(this.title, this.value);

  final String title;
  final int value;

  static List<GlobalModel> mockItems =
      List.generate(10, (index) => GlobalModel('$index ----', index));
}
