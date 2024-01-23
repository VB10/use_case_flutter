import 'package:async/async.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/cancalable_auto_complete/model/durations.dart';
import 'package:use_case_flutter/use_case/cancalable_auto_complete/model/errors.dart';
import 'package:use_case_flutter/use_case/cancalable_auto_complete/model/tv_show.dart';
import 'package:use_case_flutter/use_case/cancalable_auto_complete/service/tv_service.dart';
import 'package:vexana/vexana.dart';

class AutoCancelableView extends StatefulWidget {
  const AutoCancelableView({super.key});
  @override
  State<AutoCancelableView> createState() => _AutoCancelableViewState();
}

class _AutoCancelableViewState extends State<AutoCancelableView> with _AutoCancel {
  @override
  void initState() {
    super.initState();
    final manager =
        NetworkManager<EmptyModel>(options: BaseOptions(baseUrl: 'https://api.tvmaze.com'), isEnableLogger: true);
    manager.interceptors.add(ChuckerDioInterceptor());
    tvService = TvService(
      manager,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Autocomplete<TvShow>(
        displayStringForOption: (option) {
          return option.show?.name ?? '';
        },
        optionsBuilder: (textEditingValue) async {
          return  search(textEditingValue.text);
        },
      ),
    );
  }
}

mixin _AutoCancel on State<AutoCancelableView> {
  CancelableOperation<void>? _cancelableOperation;
  late final ITvService tvService;

  Future<List<TvShow>> search(String key) async {
    await _cancelableOperation?.cancel();
    _cancelableOperation = CancelableOperation.fromFuture(
      Future.delayed(Duration(seconds: 1)),
      onCancel: () {
        ErrorsMixin.print('Operation is canceled');
      },
    );

    var items = <TvShow>[];
    await _cancelableOperation?.value.then((result) async {
      items = await tvService.fetchItems(key) ?? [];
    });

    return items;
  }
}
