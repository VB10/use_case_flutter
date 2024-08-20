import 'package:equatable/equatable.dart';

final class BackToFormState extends Equatable {
  const BackToFormState({
    this.isFormEmpty = true,
    this.isFormValid = false,
  });

  final bool isFormEmpty;
  final bool isFormValid;

  BackToFormState copyWith({
    bool? isFormEmpty,
    bool? isFormValid,
  }) {
    return BackToFormState(
      isFormEmpty: isFormEmpty ?? this.isFormEmpty,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  @override
  List<Object> get props => [isFormEmpty, isFormValid];
}
