import 'package:permission_handler/permission_handler.dart';

abstract class IPermissionCheck {
  Future<bool> checkMediaLibrary();
}

class ApplicationPermissionCheck implements IPermissionCheck {
  @override
  Future<bool> checkMediaLibrary() async {
    final status = await Permission.photos.status;

    return status.isGranted;
  }
}
