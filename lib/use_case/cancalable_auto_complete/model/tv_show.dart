import 'package:vexana/vexana.dart';

class TvShow extends INetworkModel<TvShow> {
  final double? score;
  final Show? show;

  TvShow({this.score, this.show});

  factory TvShow.fromJson(Map<String, dynamic> json) {
    return TvShow(score: json['score'], show: json['show'] != null ? Show.fromJson(json['show']) : null);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  String? status;

  Show({this.id, this.url, this.name, this.type, this.language, this.status});

  Show.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    type = json['type'];
    language = json['language'];
    status = json['status'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    return Show.fromJson(json);
  }
}
