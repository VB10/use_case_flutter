import 'package:use_case_flutter/use_case/local_search/model/service_agreement_mask.dart';

class Payload {
  Payload({
    this.serviceAgreementMask,
  });
  factory Payload.fromJson(Map<String, dynamic> json) {
    return Payload(
      serviceAgreementMask: (json['ServiceAgreementMask'] as List<dynamic>?)
          ?.map((e) => ServiceAgreementMask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  List<ServiceAgreementMask>? serviceAgreementMask;
}
