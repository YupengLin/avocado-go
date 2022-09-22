part of '../config.dart';

class Configurations {
  static Map _advanceConfig = DefaultConfig.advanceConfig;
  static Map get advanceConfig => _advanceConfig;
  void setConfigurationValues(Map<String, dynamic> value) {
    _advanceConfig = value['advanceConfig'] != null
        ? Map.from(value['advanceConfig'])
        : DefaultConfig.advanceConfig;
  }
}

// extension ConfigurationsFireBaseRemoteConfig on Configurations {
//   Future<void> loadRemoteConfig() async {
//     if (Configurations.enableRemoteConfigFirebase) {
//       final remoteConfig = await Services().firebase.loadRemoteConfig();
//       if (remoteConfig != null) {
//         for (var item in _listConfigRemoteKey) {
//           _loadConfig(item, remoteConfig);
//         }
//       }
//     }
//   }
// }
