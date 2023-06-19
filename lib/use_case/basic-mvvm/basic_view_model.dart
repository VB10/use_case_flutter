import 'package:use_case_flutter/use_case/basic-mvvm/basic_model.dart';
import 'package:use_case_flutter/use_case/basic-mvvm/core/basic_cache.dart';

class BasicViewModel {
  const BasicViewModel(this.cache);

  final BasicCacheInterface cache;

  Future<bool> controlToUserName(BasicModel model) async {
    await Future.delayed(const Duration(seconds: 2));
    return model.userName.length.isOdd ? true : false;
  }

  void saveUserNameToCache(String userName) {
    cache.saveString(userName);
  }
}
