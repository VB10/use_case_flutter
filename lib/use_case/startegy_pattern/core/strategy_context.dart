import 'package:flutter/material.dart';

enum StrategyResult {
  success,
  failure,
}

mixin Operation {
  Future<StrategyResult?> execute(BuildContext context);
}

class StrategyContext {
  StrategyContext(this._operation, {required this.context});
  Operation _operation;
  final BuildContext context;

  void changeStrategy(Operation operation) {
    _operation = operation;
  }

  Future<StrategyResult?> run() {
    return _operation.execute(context);
  }
}
