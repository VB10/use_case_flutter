import 'package:flutter/foundation.dart';
import 'package:use_case_flutter/use_case/local_search/model/service_agreement_mask.dart';

class LocalSearchController {
  Future<List<ServiceAgreementMask>> fetchDataHigher90k(
    List<ServiceAgreementMask> items,
  ) async {
    final response = await compute(
      _LocalSearch.fetchZipCodeHigher,
      SearchZipModel(items, 94122),
    );
    return response;
  }

  Future<List<ServiceAgreementMask>> agreementFullSearch(
    List<ServiceAgreementMask> items,
    String key,
  ) async {
    return compute(_LocalSearch.searchKey, SearchZipSearchModel(items, key));
  }
}

class _LocalSearch {
  // Users want to show items bigger then 90k but please don't do it this operation on empty zip code
  // ServiceAgreementStatus == active
  static List<ServiceAgreementMask> fetchZipCodeHigher(
    SearchZipModel model,
  ) {
    final response = model.items
        .where((element) => element.agreement == ServiceAgreements.passive)
        .where((element) => element.zipCode > 0)
        .where(
          (element) => element.zipCode > model.maximumValue,
        )
        .map((e) {
      e.zip = '10';
      return e;
    }).toList();

    return response;
  }

  static List<ServiceAgreementMask> searchKey(
    SearchZipSearchModel model,
  ) {
    return model.items
        .where(
          (element) => element.toString().contains(model.key),
        )
        .toList();
  }
}

class SearchZipModel {
  SearchZipModel(this.items, this.maximumValue);

  final List<ServiceAgreementMask> items;
  final int maximumValue;
}

class SearchZipSearchModel {
  SearchZipSearchModel(this.items, this.key);

  final List<ServiceAgreementMask> items;
  final String key;
}
