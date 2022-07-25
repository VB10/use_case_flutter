import 'package:vexana/vexana.dart';

import '../model/tv_show.dart';

abstract class ITvService {
  ITvService(INetworkManager networkManager) : _manager = networkManager;

  Future<List<TvShow>?> fetchItems(String key);

  final INetworkManager _manager;
}

class TvService extends ITvService {
  TvService(super.networkManager);

  @override
  Future<List<TvShow>?> fetchItems(String key) async {
    final response = await _manager.send<TvShow, List<TvShow>>(_TvServicePath.search.withDivider,
        urlSuffix: _TvServicePath.shows.withDivider,
        queryParameters: Map.fromEntries([_Queries.q.value(key)]),
        parseModel: TvShow(),
        method: RequestType.GET);

    return response.data;
  }
}

enum _TvServicePath {
  search,
  shows;

  String get withDivider => '/$name';
}

enum _Queries {
  q;

  MapEntry<String, String> value(String value) {
    return MapEntry(name, value);
  }
}
