import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:use_case_flutter/use_case/social/core/social_adapter.dart';
import 'package:use_case_flutter/use_case/social/core/social_button.dart';

class SocialView extends StatefulWidget {
  const SocialView({super.key});
  @override
  State<SocialView> createState() => _SocialViewState();
}

class _SocialViewState extends State<SocialView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButton(
              adapter: AppleAdapter(),
              onCompleted: print,
            ),
            SocialButton(
              adapter: GoogleAdapter(),
              onCompleted: print,
            ),
            SocialButton(
              adapter: FacebookAdapter(),
              onCompleted: print,
            ),
            SocialButton(
              adapter: MicrosoftAdapter(),
              onCompleted: (token) {
                if (token.isNullOrEmpty) {
                  // call your backend
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
