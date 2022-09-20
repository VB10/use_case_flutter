import 'package:flutter/material.dart';
import 'package:use_case_flutter/core/init/main_build.dart';
import 'package:use_case_flutter/product/generation/assets.gen.dart';
import 'package:use_case_flutter/product/generation/colors.gen.dart';
import 'package:use_case_flutter/use_case/modular_field/modular_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      builder: MainBuild.build,
      theme: ThemeData.light().copyWith(
        errorColor: ColorName.orange,
      ),
      home: const ModularView(),
    );
  }
}
