import 'package:bloc/bloc.dart';

import 'package:use_case_flutter/use_case/global_management/cubit/global_manage_state.dart';
import 'package:use_case_flutter/use_case/global_management/global_model.dart';

class GlobalManageCubit extends Cubit<GlobalManageState> {
  GlobalManageCubit() : super(const GlobalManageState(isLoading: true));

  Future<void> fetchInitialData() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {},
    );

    emit(state.copyWith(globalItems: GlobalModel.mockItems, isLoading: false));
  }

  Future<void> filterItems(int value) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(
      const Duration(seconds: 1),
      () {},
    );

    emit(
      state.copyWith(
        isLoading: false,
        globalItems: GlobalModel.mockItems
            .where((element) => element.value >= value)
            .toList(),
      ),
    );
  }
}
