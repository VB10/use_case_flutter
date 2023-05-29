flutter pub run pigeon \
  --input lib/use_case/code_gen/pigeon/token_parse.dart \
  --dart_out lib/product/native/native_cache_bridge.dart \
  --objc_header_out ios/Runner/native_cache_bridge.h \
  --objc_source_out ios/Runner/native_cache_bridge.m \
  --java_out ./android/app/src/main/kotlin/com/example/use_case_flutter/native_cache_bridge.java \
  --java_package "com.example.use_case_flutter"