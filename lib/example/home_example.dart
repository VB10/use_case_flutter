import 'package:codegen/codegen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeExampleView extends StatefulWidget {
  const HomeExampleView({super.key});
  @override
  State<HomeExampleView> createState() => _HomeExampleViewState();
}

class _HomeExampleViewState extends State<HomeExampleView> {
  static const String packageName = 'codegen';

  final user = User(name: 'vb');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorName.black,
        title: Text(
          LocaleKeys.account.tr(),
          style: const TextStyle(
            color: ColorName.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Assets.images.imageTrip.svg(
            package: packageName,
          ),
          Text(user.name ?? '')
        ],
      ),
    );
  }
}
