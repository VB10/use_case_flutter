import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/startegy_pattern/strategy_home_mixin.dart';

class StrategyHomeView extends StatefulWidget {
  const StrategyHomeView({super.key});
  @override
  State<StrategyHomeView> createState() => _StrategyHomeViewState();
}

class _StrategyHomeViewState extends State<StrategyHomeView> with StrategyHomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Strategy Pattern')),
      floatingActionButton: FloatingActionButton(
        onPressed: onStartedLogic,
      ),
    );
  }
}
