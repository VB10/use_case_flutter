import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/strategy_pattern/core/strategy_context.dart';
import 'package:use_case_flutter/use_case/strategy_pattern/features/index.dart';
import 'package:use_case_flutter/use_case/strategy_pattern/strategy_home_view.dart';

mixin StrategyHomeMixin on State<StrategyHomeView> {
  Future<void> onStartFlow() async {
    final strategyContext = StrategyContext(
      const StrategyApprove(),
      context: context,
    );
    var response = await strategyContext.run();

    if (response == StrategyResult.success) {
      if (!mounted) return;
      strategyContext.changeStrategy(const StrategyLicense());
      response = await strategyContext.run();
    }

    response ??= StrategyResult.failure;
    if (!mounted) return;
    strategyContext.changeStrategy(StrategyBottom(response));
    await strategyContext.run();
  }
}
