import 'dart:html';

import 'package:use_case_flutter/use_case/platfrom_import/text_show/platform_show.dart';

PlatformShow get createAdapter => TextShowAcceptedWeb();

class TextShowAcceptedWeb implements PlatformShow {
  @override
  String platformName() {
    return '${HttpStatus.accepted} WEB ${document.body?.innerHtml}';
  }
}
