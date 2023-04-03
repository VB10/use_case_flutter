import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/foundation.dart';

import 'package:use_case_flutter/product/product_envrioment.dart';

@immutable
class HttpLogManager {
  HttpLogManager.check() {
    if (kDebugMode) {
      _productEnvironment = ProductEnvironment.dev;
    } else {
      _productEnvironment = ProductEnvironment.prodTest;
    }

    _showLogger();
  }
  late final ProductEnvironment _productEnvironment;

  void _showLogger() {
    switch (_productEnvironment) {
      case ProductEnvironment.dev:
        ChuckerFlutter.showOnRelease = true;
        break;
      case ProductEnvironment.prodTest:
        ChuckerFlutter.showOnRelease = true;
        break;
      case ProductEnvironment.prod:
        ChuckerFlutter.showOnRelease = false;

        return;
    }
  }

  static void show() {
    if (ChuckerFlutter.showOnRelease) {
      ChuckerFlutter.showChuckerScreen();
    }
  }
}
