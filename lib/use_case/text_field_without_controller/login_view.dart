import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/text_field_without_controller/clear_action.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginController {
  late final ClearTextAction textAction;
  late final ControllerCleaner _controllerCleaner;
  String _value = '';
  @override
  void initState() {
    super.initState();
    textAction = ClearTextAction();
    _controllerCleaner = ControllerCleaner(textAction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _homeButton(),
          _removeButton(),
        ],
      ),
      appBar: AppBar(),
      body: _CustomTextField(
        action: textAction,
        onChange: (String value) {
          _value = value;
        },
      ),
    );
  }

  FloatingActionButton _homeButton() {
    return FloatingActionButton.large(
      child: const Icon(Icons.home),
      onPressed: () {
        _controllerCleaner.update('vb');
      },
    );
  }

  FloatingActionButton _removeButton() {
    return FloatingActionButton(
      onPressed: _controllerCleaner.clear,
      child: const Icon(Icons.remove),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  _CustomTextField({
    required this.action,
    required this.onChange,
  });

  final TextEditingController _controller = TextEditingController();
  final ClearTextAction action;
  final void Function(String value) onChange;
  @override
  Widget build(BuildContext context) {
    return ActionListener(
      action: action,
      listener: (action) {
        if (action is ClearTextAction) {
          if (action.text.isEmpty) {
            _controller.clear();
          } else {
            _controller.text = action.text;
          }
        }
      },
      child: TextField(
        onChanged: onChange,
        controller: _controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class ControllerCleaner {
  ControllerCleaner(ClearTextAction clearTextAction) : _clearTextAction = clearTextAction;
  final ClearTextAction _clearTextAction;

  void clear() {
    _clearTextAction.invoke(const ClearTextIntent());
  }

  void update(String title) {
    _clearTextAction.invoke(ClearTextIntent(text: title));
  }
}

mixin LoginController on State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void updateController(List args) {}
}

// class XS extends StatelessWidget {
//   const XS({super.key});
//   final textController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           controller: textController,
//         ),
//         ElevatedButton(
//           onPressed: () {
//             textController.clear();
//             textController.text = "";
//             textController.dispose();
//           },
//           child: const Text('Clear'),
//         ),
//       ],
//     );
//   }
// }
