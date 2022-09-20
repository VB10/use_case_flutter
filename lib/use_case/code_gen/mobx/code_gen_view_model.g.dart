// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_gen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CodeGenViewModel on _CodeGenViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CodeGenViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_CodeGenViewModelBaseActionController =
      ActionController(name: '_CodeGenViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_CodeGenViewModelBaseActionController.startAction(
        name: '_CodeGenViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_CodeGenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
