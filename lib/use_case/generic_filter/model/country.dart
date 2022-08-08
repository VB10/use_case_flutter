import 'package:use_case_flutter/use_case/generic_filter/filter_view.dart';

enum Countries {
  istanbul('Istanbul'),
  london('London'),
  boston('Boston');

  final String uniqueName;
  const Countries(this.uniqueName);
  static List<String> get names {
    return Countries.values.map((e) => e.uniqueName).toList();
  }

  static List<Country> get models {
    return Countries.values.map((e) => Country(e)).toList();
  }
}

class Country extends IFilter {
  final Countries country;

  Country(this.country);

  @override
  int get id => country.index;

  @override
  String get key => country.uniqueName;
}
