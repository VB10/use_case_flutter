import 'package:pigeon/pigeon.dart';

class Value {
  int? number;
}

enum Results { success, fail }

class ResultModel {
  ResultModel(this.result, this.token);

  final Results? result;
  final String? token;
}

@HostApi()
abstract class Api2Host {
  @async
  Value calculate(Value value);
  ResultModel tokenParse(String id);
}
