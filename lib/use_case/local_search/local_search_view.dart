// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:use_case_flutter/use_case/local_search/cancalable/cancalable.dart';
import 'package:use_case_flutter/use_case/local_search/constants/json_items.dart';
import 'package:use_case_flutter/use_case/local_search/controller/local_search_controller.dart';
import 'package:use_case_flutter/use_case/local_search/mixin/asset_reader_mixin.dart';
import 'package:use_case_flutter/use_case/local_search/model/service_agreement_mask.dart';
import 'package:use_case_flutter/use_case/local_search/model/services.dart';

class LocalSearchView extends StatefulWidget {
  const LocalSearchView({super.key});
  @override
  State<LocalSearchView> createState() => _LocalSearchViewState();
}

class _LocalSearchViewState extends State<LocalSearchView> with AssertMixin {
  Services? services;
  late final LocalSearchController _localSearchController;
  final _localTextBigger = 'Show bigger zip';
  List<ServiceAgreementMask>? get _agreementMasks => services?.payload?.serviceAgreementMask;
  late final CancelableCustomOperation<String> cancelableCustomOperation;
  List<ServiceAgreementMask> rootList = [];
  @override
  void initState() {
    super.initState();
    _localSearchController = LocalSearchController();
    cancelableCustomOperation = CancelableCustomOperation(
      (value) {
        setState(() {
          searchByKey(value);
        });
      },
    );
  }

  Future<void> load() async {
    final data = await readData(JsonItems.largeJsonPath);
    if (data == null) return;
    setState(() {
      services = Services.fromJson(data);
    });
    if (_agreementMasks != null) {
      rootList = _agreementMasks!.toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: load,
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: Text(services?.header?.verb ?? ''),
        actions: [
          LottieItems.colorLoading(),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: search,
                  child: Text(_localTextBigger),
                )
              ];
            },
          )
        ],
      ),
      body: _agreementMasks != null
          ? Column(
              children: [
                TextField(
                  onChanged: cancelableCustomOperation.onItemChanged,
                ),
                Expanded(
                  child: _AgrementListView(
                    items: _agreementMasks!,
                  ),
                ),
              ],
            )
          : null,
    );
  }
}

class _AgrementListView extends StatelessWidget {
  const _AgrementListView({
    required this.items,
  });

  final List<ServiceAgreementMask> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(
              items[index].city ?? '',
            ),
            leading: Text('$index'),
            trailing: Text(
              items[index].zip ?? '',
            ),
          ),
        );
      },
    );
  }
}

extension _LocalSearchHigher on _LocalSearchViewState {
  Future<void> search() async {
    final items = services?.payload?.serviceAgreementMask;
    if (items == null || items.isEmpty) return;
    final response = await _localSearchController.fetchDataHigher90k(items);
    setState(() {
      services?.payload?.serviceAgreementMask = response;
    });
  }

  Future<void> searchByKey(String key) async {
    if (rootList.isEmpty) return;
    final response = await _localSearchController.agreementFullSearch(
      rootList,
      key,
    );
    setState(() {
      services?.payload?.serviceAgreementMask = response;
    });
  }
}

class LottieItems extends LottieBuilder {
  LottieItems.network(super.src) : super.network();

  LottieItems.hallowen() : super.network('https://assets5.lottiefiles.com/packages/lf20_k1zjUH.json');
  LottieItems.colorLoading() : super.network('https://assets2.lottiefiles.com/packages/lf20_u3lnfw4q.json');
}
