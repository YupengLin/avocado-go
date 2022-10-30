import 'package:avocado_go/utils/logs.dart';

import '../../../services/base_services.dart';
import 'avocado_go_api.dart';

class AvocadoGoService extends BaseServices {
  Map<String, dynamic>? configCache;
  final AvocadoGoAPI wcApi;

  AvocadoGoService({required String domain})
      : wcApi = AvocadoGoAPI(domain),
        super(domain: domain) {
    configCache = null;
  }

  @override
  Future<List?>? getTrending1Month() async {
    var endpoint = "/v1/eth/collection/trending_1_month";
    try {
      var response = await wcApi.getAsyncV2(endpoint);
      printLog(response);
    } catch (err, trace) {
      printError(err, trace);
    }

    return [];
  }
}
