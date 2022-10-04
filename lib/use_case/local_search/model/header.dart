class Header {
  Header({
    this.verb,
  });

  factory Header.fromJson(Map<String, dynamic> json) {
    return Header(
      verb: json['Verb'] as String?,
    );
  }

  String? verb;
}
