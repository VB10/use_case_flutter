import 'package:use_case_flutter/use_case/local_search/model/header.dart';
import 'package:use_case_flutter/use_case/local_search/model/payload.dart';
import 'package:use_case_flutter/use_case/local_search/model/reply.dart';

class Services {
  Services({
    this.header,
    this.reply,
    this.payload,
  });
  factory Services.fromJson(Map<String, dynamic> json) {
    return Services(
      header: json['Header'] == null ? null : Header.fromJson(json['Header'] as Map<String, dynamic>),
      reply: json['Reply'] == null ? null : Reply.fromJson(json['Reply'] as Map<String, dynamic>),
      payload: json['Payload'] == null ? null : Payload.fromJson(json['Payload'] as Map<String, dynamic>),
    );
  }
  Header? header;
  Reply? reply;
  Payload? payload;
}
