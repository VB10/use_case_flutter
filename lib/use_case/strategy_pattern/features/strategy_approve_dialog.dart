import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/strategy_pattern/core/strategy_context.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('------ Random Approive ---'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(StrategyResult.success);
              },
              child: const Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }
}
