import 'package:flutter/material.dart';

import 'core/logger_mixin.dart';

class GenericHomeDetailView extends StatefulWidget {
  const GenericHomeDetailView({Key? key, required this.id}) : super(key: key);

  final String id;
  @override
  State<GenericHomeDetailView> createState() => _GenericHomeDetailViewState();
}

class _GenericHomeDetailViewState extends State<GenericHomeDetailView> with LoggerMixin {
  @override
  void init() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(widget.id)),
    );
  }

  @override
  // TODO: implement key
  final PageSpecialKeys key = PageSpecialKeys.detail;

  @override
  CustomModel get model => CustomModel(id: widget.id, description: 'This is a detail page');
}
