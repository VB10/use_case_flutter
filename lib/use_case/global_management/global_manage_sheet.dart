import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_case_flutter/use_case/global_management/provider/global_manage_provider.dart';

class GlobalManageSheet extends StatelessWidget {
  const GlobalManageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            context.manageProvider.updateFilter(4);
            Navigator.of(context).pop(true);
          },
          icon: const Icon(Icons.looks_4),
        ),
        IconButton(
          onPressed: () {
            context.read<GlobalManagerProvider>().updateFilter(5);
            Navigator.of(context).pop(true);
          },
          icon: const Icon(Icons.looks_5),
        ),
      ],
    );
  }
}
