import 'package:flutter_test/flutter_test.dart';
import 'package:use_case_flutter/use_case/cancalable_auto_complete/service/tv_service.dart';
import 'package:vexana/vexana.dart';

void main() {
  late ITvService tvService;
  setUp(() {
    tvService =
        TvService(NetworkManager(options: BaseOptions(baseUrl: 'https://api.tvmaze.com'), isEnableLogger: true));
  });
  test('Fetch kids shows', () async {
    final response = await tvService.fetchItems('kids');
    expect(response, isNotNull);
  });
}
