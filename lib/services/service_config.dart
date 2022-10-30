import 'base_services.dart';
import 'package:inspireui/utils/logs.dart';
// class Config {
//   ConfigType? type;
//   String? url;
// }

mixin ConfigMixin {
  late BaseServices api;
  bool init = false;

  /// mock services for FluxBuilder
  void configBase({
    required BaseServices apiServices,
    required appConfig,
  }) {
    setAppConfig(appConfig);
    api = apiServices;
    init = true;
  }

  void configAvocado(appConfig) {}
  void setAppConfig(appConfig) {
    printLog('[🌍appConfig] ${appConfig['type']} $appConfig');

    configAvocado(appConfig);
  }
}
