class Reply {
  Reply({
    this.result,
  });

  factory Reply.fromJson(Map<String, dynamic> json) {
    return Reply(
      result: json['Result'] as String?,
    );
  }
  String? result;
}
