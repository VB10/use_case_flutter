import 'package:mobx/mobx.dart';
part 'code_gen_view_model.g.dart';

class CodeGenViewModel = _CodeGenViewModelBase with _$CodeGenViewModel;

abstract class _CodeGenViewModelBase with Store {
  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
