// Text controller datayi alsin, bunuda servise yollayip sonucuna gore sayfaya atsin

import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/basic-mvvm/basic_view_model.dart';
import 'package:use_case_flutter/use_case/basic-mvvm/core/basic_cache.dart';
import 'package:use_case_flutter/use_case/basic-mvvm/view/basic_view_mixin.dart';

part './view/basic_input_field.dart';

// 1- Validasyon yapilacak -> text'in uzunlugu 3ten buyuk olmali
// 2- Validasyon basarili ise buton aktif olmali
// 3- Butona tiklandiginda text controllerdaki degeri alip servise yollasin
// 4- Servisten gelen sonucu ekrana yazsin

class BasicView extends StatefulWidget {
  const BasicView({super.key});

  @override
  State<BasicView> createState() => _BasicViewState();
}

class _BasicViewState extends State<BasicView> with BasicViewMixin {
  final BasicViewModel _viewModel = BasicViewModel(BasicCache());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text('Go to Result Page'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text('Go to Result Page'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text('Go to Result Page'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text('Go to Result Page'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text('Go to Result Page'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text('Go to Result Page'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text('Go to Result Page'),
          ),
          _BasicInputField(userNameController, onControllerChange),
          _SaveButton(
            isValidForTextController: isValidForTextController,
            onPressed: () async {
              final response = await _viewModel.controlToUserName(basicRequestModel);
              await controlToResult(result: response);
            },
          )
        ],
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    required this.isValidForTextController,
    required this.onPressed,
  });

  final ValueNotifier<bool> isValidForTextController;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isValidForTextController,
      builder: (context, value, child) {
        return ElevatedButton(
          onPressed: value == false ? null : onPressed,
          child: const Text('Save'),
        );
      },
    );
  }
}
