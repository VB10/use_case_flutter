class Reply {
  Reply({
    this.result,
  });
  factory Reply.fromJson(Map<String, dynamic> json) {
    return Reply(
      result: json['Result'] as String?,
    );
  }

  static List<Reply> get replies => List.generate(
        10,
        (index) => Reply(
          result: 'reply_$index',
        ),
      );
  String? result;
}
