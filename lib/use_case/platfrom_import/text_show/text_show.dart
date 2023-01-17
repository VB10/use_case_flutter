import 'dart:io';

import 'package:use_case_flutter/use_case/platfrom_import/text_show/platform_show.dart';

PlatformShow get createAdapter => TextShowAccepted();

class TextShowAccepted extends PlatformShow {
  @override
  String platformName() {
    return '${HttpStatus.accepted}';
  }
}
