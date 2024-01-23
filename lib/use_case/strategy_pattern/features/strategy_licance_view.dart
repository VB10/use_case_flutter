import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/strategy_pattern/core/strategy_context.dart';

@immutable
class StrategyLicense with Operation {
  const StrategyLicense();

  @override
  Future<StrategyResult?> execute(BuildContext context) async {
    final response = await Navigator.of(context).push<StrategyResult?>(
      MaterialPageRoute<StrategyResult>(
        builder: (_) => const StrategyLicenseView(),
      ),
    );

    return response;
  }
}

class StrategyLicenseView extends StatefulWidget {
  const StrategyLicenseView({super.key});
  @override
  State<StrategyLicenseView> createState() => _StrategyLicenseViewState();
}

class _StrategyLicenseViewState extends State<StrategyLicenseView> {
  bool _isCheck = false;

  void _updateCheck(bool? value) {
    if (value == null) return;
    if (_isCheck == value) return;
    // _isCheck = value;
    setState(() {
      _isCheck = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('------ Random ---'),
          Checkbox(
            value: _isCheck,
            onChanged: _updateCheck,
          ),
          ElevatedButton(
            onPressed: !_isCheck
                ? null
                : () {
                    Navigator.of(context).pop(StrategyResult.success);
                  },
            child: const Icon(Icons.check),
          ),
        ],
      ),
    );
  }
}
