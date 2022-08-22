import 'package:flutter/material.dart';
import 'package:uikit/widget/index.dart';

class ModularView extends StatefulWidget {
  const ModularView({Key? key}) : super(key: key);
  @override
  State<ModularView> createState() => _ModularViewState();
}

class _ModularViewState extends State<ModularView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CustomGradientButton(title: 'Login'),
          CustomNetworkImage(url: ''),
        ],
      ),
    );
  }
}
