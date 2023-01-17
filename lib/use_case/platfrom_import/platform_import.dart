import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/platfrom_import/text_show/platform_show.dart';
import 'package:use_case_flutter/use_case/platfrom_import/text_show/text_show.dart'
    if (dart.library.html) 'package:use_case_flutter/use_case/platfrom_import/text_show/text_show_web.dart' as show;

class PlatformImportView extends StatefulWidget {
  const PlatformImportView({super.key});
  @override
  State<PlatformImportView> createState() => _PlatformImportViewState();
}

class _PlatformImportViewState extends State<PlatformImportView> {
  final PlatformShow platformShow = show.createAdapter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(platformShow.platformName())),
    );
  }
}
