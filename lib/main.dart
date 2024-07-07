import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:use_case_flutter/core/init/main_build.dart';
import 'package:use_case_flutter/product/init/enviroment/http_log_manager.dart';
import 'package:use_case_flutter/use_case/advanced_inherited/advaned_inherited_state.dart';
import 'package:use_case_flutter/use_case/complex_form/complex_form_view.dart';
import 'package:use_case_flutter/use_case/global_management/provider/global_manage_provider.dart';

void main() => runApp(
      Provider(
        create: (context) => GlobalManagerProvider(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HttpLogManager.check();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      builder: MainBuild.build,
      theme: ThemeData.light().copyWith(
          // colorScheme: ColorScheme(
          //   error: ColorName.orange,
          //   brightness: Brightness.light,
          // ),
          ),
      home: const AdvancedInheritedProvider(),
      navigatorObservers: [ChuckerFlutter.navigatorObserver],
    );
    return GestureDetector(
      onDoubleTap: HttpLogManager.show,
      child: MaterialApp(
        title: 'Material App',
        builder: MainBuild.build,
        theme: ThemeData.light().copyWith(
            // colorScheme: ColorScheme(
            //   error: ColorName.orange,
            //   brightness: Brightness.light,
            // ),
            ),
        home: const ComplexFormView(),
        navigatorObservers: [ChuckerFlutter.navigatorObserver],
      ),
    );
  }
}
