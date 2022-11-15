import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_case_flutter/use_case/global_management/cubit/global_manage_cubit.dart';

class GlobalManagerProvider {
  GlobalManageCubit? _manageCubit;

  void init(GlobalManageCubit cubit) {
    if (_manageCubit != null) return;
    _manageCubit = cubit;
  }

  void updateFilter(int value) {
    if (_manageCubit == null) throw Exception('cubit has not initialzed');
    _manageCubit!.filterItems(value);
  }
}

extension GlobalContextExtension on BuildContext {
  GlobalManagerProvider get manageProvider => read<GlobalManagerProvider>();
}
