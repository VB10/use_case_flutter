/// A custom validator class to validate the form fields.
final class CustomValidator {
  CustomValidator({required this.value});

  final String? value;

  /// Returns an error message if the [value] is null or empty.
  String? get emptyCheck {
    if (value == null || value!.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}
