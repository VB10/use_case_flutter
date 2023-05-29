import 'package:flutter/foundation.dart';

import 'package:use_case_flutter/use_case/global_management/global_model.dart';

@immutable
class GlobalManageState {
  const GlobalManageState({
    this.isLoading = false,
    this.globalItems,
  });

  final bool isLoading;
  final List<GlobalModel>? globalItems;

  GlobalManageState copyWith({
    bool? isLoading,
    List<GlobalModel>? globalItems,
  }) {
    return GlobalManageState(
      isLoading: isLoading ?? this.isLoading,
      globalItems: globalItems ?? this.globalItems,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GlobalManageState &&
        other.isLoading == isLoading &&
        listEquals(other.globalItems, globalItems);
  }

  @override
  int get hashCode => isLoading.hashCode ^ globalItems.hashCode;
}
