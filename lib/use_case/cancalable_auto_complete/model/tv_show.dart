import 'package:vexana/vexana.dart';

class TvShow extends INetworkModel<TvShow> {
  TvShow({this.score, this.show});
  factory TvShow.fromJson(Map<String, dynamic> json) {
    return TvShow(
      score: json['score'] is double ? json['score'] as double : 1,
      show: json['show'] != null ? Show.fromJson() : null,
    );
  }
  final double? score;
  final Show? show;

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['score'] = score;
    if (show != null) {
      data['show'] = show!.toJson();
    }
    return data;
  }

  @override
  TvShow fromJson(Map<String, dynamic> json) {
    return TvShow.fromJson(json);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TvShow && other.score == score && other.show == show;
  }

  @override
  int get hashCode => score.hashCode ^ show.hashCode;
}

class Show extends INetworkModel<Show> {
  Show({this.id, this.url, this.name, this.type, this.language, this.status});
  Show.fromJson() {
    // id = json['id'];
    // url = json['url'];
    // name = json['name'];
    // type = json['type'];
    // language = json['language'];
    // status = json['status'];
  }
  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  String? status;

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['name'] = name;
    data['type'] = type;
    data['language'] = language;
    data['status'] = status;
    return data;
  }

  @override
  Show fromJson(Map<String, dynamic> json) {
    return Show.fromJson();
  }
}
