import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:use_case_flutter/use_case/background_pick_check/life_cycle_manage_mixin.dart';
import 'package:use_case_flutter/use_case/background_pick_check/permisson_check.dart';
import 'package:use_case_flutter/use_case/background_pick_check/pick_manager.dart';

class BackgroundPickCheckView extends StatefulWidget {
  const BackgroundPickCheckView({super.key});
  @override
  State<BackgroundPickCheckView> createState() => _BackgroundPickCheckViewState();
}

class _BackgroundPickCheckViewState extends State<BackgroundPickCheckView> with WidgetsBindingObserver, LifeCyleUse {
  @override
  void initState() {
    super.initState();
    _checkPhotoAccess();
  }

  Future<void> _checkPhotoAccess() async {
    _latestResultPermission = await ApplicationPermissionCheck().checkMediaLibrary();
    setState(() {});
  }

  final String _appTitle = 'Picker Validation Check';
  final String _pickYourPhoto = 'Pick your Photo';

  final IPickManager pickImage = PickManager();
  XFile? image;

  bool? _latestResultPermission;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appTitle)),
      body: Column(
        children: [
          SwitchListTile(value: _latestResultPermission ?? false, onChanged: (value) {}),
          ElevatedButton.icon(
            onPressed: () async {
              final model = await pickImage.fetchMediaImage();
              // if (model.file != null && model.status ) {

              // }
              setState(() {
                image = model?.file;
              });
            },
            icon: const Icon(Icons.library_add),
            label: Text(_pickYourPhoto),
          ),
          _FutureByteImage(image: image),
        ],
      ),
    );
  }

  @override
  void onResume() {
    _checkPhotoAccess();
    print('git kontrol et photo libray izini alinmis mi?');
  }
}

class _FutureByteImage extends StatelessWidget {
  const _FutureByteImage({
    required this.image,
  });

  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: image?.readAsBytes(),
      builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
        if (snapshot.data != null) {
          return Image.memory(snapshot.data!);
        }
        return const SizedBox();
      },
    );
  }
}
