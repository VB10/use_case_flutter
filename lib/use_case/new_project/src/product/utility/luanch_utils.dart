import 'package:url_launcher/url_launcher_string.dart';

mixin LaunchMixins {
  /// When user need to call other phone number
  void launchPhone(String value) {
    launchUrlString('tel:$value');
  }
}
