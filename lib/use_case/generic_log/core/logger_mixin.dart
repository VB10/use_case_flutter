import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:use_case_flutter/use_case/generic_log/core/project_logger.dart';

mixin LoggerMixin<T extends StatefulWidget> on State<T> {
  PageSpecialKeys get key;
  CustomModel get model;
  void init();
  @override
  void initState() {
    super.initState();
    ProjectCustomLog.instance.logClassName(this);
    ProjectCustomLog.instance.logPageName(key);
    ProjectCustomLog.instance.logCustomModel(model);
    init();
  }
}

enum PageSpecialKeys { home, detail }

class CustomModel {
  CustomModel({this.id, this.description});
  // TODO: Fixme
  factory CustomModel.fromJson(String source) => CustomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory CustomModel.fromMap(Map<String, dynamic> map) {
    return CustomModel(
      id: map['id'].toString(),
      description: map['description'].toString(),
    );
  }
  final String? id;
  final String? description;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
    };
  }

  String toJson() => json.encode(toMap());
}
