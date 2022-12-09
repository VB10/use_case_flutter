import 'package:flutter/material.dart';
import 'package:use_case_flutter/product/generation/assets.gen.dart';

class CodeGenView extends StatefulWidget {
  const CodeGenView({super.key});
  @override
  State<CodeGenView> createState() => _CodeGenViewState();
}

class _CodeGenViewState extends State<CodeGenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Assets.icon.icBirds.image()),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.svg.icDog.svg(),
          )
        ],
      ),
    );
  }
}
