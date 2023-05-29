import 'package:flutter/material.dart';

import 'package:use_case_flutter/use_case/global_management/context/safe_context.dart';
import 'package:use_case_flutter/use_case/global_management/global_manage_sheet.dart';
import 'package:use_case_flutter/use_case/global_management/global_manage_view.dart';

class GlobalManageDetailView extends StatefulWidget {
  const GlobalManageDetailView({super.key});
  @override
  State<GlobalManageDetailView> createState() => _GlobalManageDetailViewState();
}

class _GlobalManageDetailViewState extends State<GlobalManageDetailView>
    with SafeContext {
  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pop(context, GlobalNavigationModel<int>(_currentValue));
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            _currentValue = 3;
          });
        },
        child: const Text('Save'),
      ),
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [
          IconButton(
            onPressed: () async {
              final result = await showModalBottomSheet<bool>(
                context: context,
                builder: (context) {
                  return const GlobalManageSheet();
                },
              );

              if (result ?? false) {
                safeOperation(() {
                  Navigator.of(context).pop();
                });
              }
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: TextField(
        maxLength: 1,
        onChanged: (value) {
          final numberValue = int.tryParse(value);
          if (numberValue == null) return;
          setState(() {
            _currentValue = numberValue;
          });
        },
      ),
    );
  }
}
