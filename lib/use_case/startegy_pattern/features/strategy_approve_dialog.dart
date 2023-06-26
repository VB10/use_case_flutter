import 'package:flutter/material.dart';

import 'package:use_case_flutter/use_case/startegy_pattern/core/strategy_context.dart';

@immutable
class StrategyApprove with Operation {
  const StrategyApprove();
  @override
  Future<StrategyResult?> execute(BuildContext context) async {
    final response = await showDialog<StrategyResult?>(
      context: context,
      builder: (context) {
        return const StrategyApproveDialog();
      },
    );
    return response;
  }
}

class StrategyApproveDialog extends StatelessWidget {
  const StrategyApproveDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          const Text('------ Random Approive ---'),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(StrategyResult.success);
            },
            child: const Icon(Icons.check),
          )
        ],
      ),
    );
  }
}
