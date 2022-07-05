import 'package:flutter/material.dart';
import 'package:use_case_flutter/core/init/main_build.dart';
import 'package:use_case_flutter/use_case/text_field_without_controller/login_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      builder: MainBuild.build,
      home: LoginView(),
    );
  }
}
