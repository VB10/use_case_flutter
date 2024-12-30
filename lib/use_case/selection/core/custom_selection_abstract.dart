import 'package:equatable/equatable.dart';

/// Note: Temprory
abstract class CustomSelectionAbstract extends Equatable {
  /// The id of the selection.
  String get id;

  /// The name of the selection.
  String get name;

  @override
  List<Object> get props => [id, name];
}
