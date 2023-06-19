part of '../basic_view.dart';

class _BasicInputField extends StatelessWidget {
  const _BasicInputField(this.userNameController, this.onChange);

  final TextEditingController userNameController;
  final ValueChanged<String> onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: userNameController,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: 'Enter a user name',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
