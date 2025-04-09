import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/strategy_pattern/core/strategy_context.dart';
import 'package:use_case_flutter/use_case/strategy_pattern/features/strategy_approve_dialog.dart';
import 'package:use_case_flutter/use_case/strategy_pattern/features/strategy_bottom_sheet.dart';
import 'package:use_case_flutter/use_case/strategy_pattern/features/strategy_licance_view.dart';
import 'package:use_case_flutter/use_case/strategy_pattern/strategy_home_view.dart';

mixin StrategyHomeMixin on State<StrategyHomeView> {
  Future<void> onStartedLogic() async {
    final strategyContext = StrategyContext(
      const StrategyLicense(),
      context: context,
    );
    var response = await strategyContext.run();

    if (response != null) {
      if (!mounted) return;
      strategyContext.changeStrategy(const StrategyApprove());
      response = await strategyContext.run();
    }
    response ??= StrategyResult.failure;
    if (!mounted) return;
    strategyContext.changeStrategy(StrategyBottom(response));
    await strategyContext.run();
  }
}
