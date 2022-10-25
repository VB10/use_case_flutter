import 'package:image_picker/image_picker.dart';

abstract class IPickImage {
  Future<XFile?> pickImageGallery();
}

class PickImageCustom implements IPickImage {
  final _picker = ImagePicker();

  @override
  Future<XFile?> pickImageGallery() => _picker.pickImage(
        source: ImageSource.gallery,
      );
}
