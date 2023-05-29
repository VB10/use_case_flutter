import 'package:app_settings/app_settings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:use_case_flutter/use_case/background_pick_check/permisson_check.dart';
import 'package:use_case_flutter/use_case/background_pick_check/pick_image_custom.dart';

abstract class IPickManager {
  final IPermissionCheck permissionCheck = ApplicationPermissionCheck();
  final IPickImage pickImageCustom = PickImageCustom();

  Future<PickImageModel?> fetchMediaImage();
}

class PickManager extends IPickManager {
  @override
  Future<PickImageModel?> fetchMediaImage() async {
    if (!await permissionCheck.checkMediaLibrary()) {
      await AppSettings.openAppSettings();
      return PickImageModel(null);
    }
    final model = await pickImageCustom.pickImageGallery();
    return PickImageModel(model, status: true);
  }
}

class PickImageModel {
  PickImageModel(this.file, {this.status = false});

  final XFile? file;

  /// It's value came from permisson. when user dint allow to accses photo library, it's set to false
  final bool status;
}
