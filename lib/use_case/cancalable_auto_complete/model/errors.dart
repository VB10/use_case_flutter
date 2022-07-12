import 'package:flutter/foundation.dart';

mixin ErrorsMixin {
  static void print(dynamic key) {
    if (!kReleaseMode) return;
    print(key);
  }
}
