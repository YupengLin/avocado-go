import '../../config.dart';
// import '../../constants.dart';

class AdvancedConfig {
  // final bool isCaching;
  // final bool kIsResizeImage;
  final bool httpCache;
  AdvancedConfig({required this.httpCache});

  factory AdvancedConfig.fromJson(Map<dynamic, dynamic> json) {
    return AdvancedConfig(
        httpCache:
            json['httpCache'] ?? DefaultConfig.advanceConfig['httpCache']);
  }
  Map<dynamic, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['httpCache'] = httpCache;
    return data;
  }
}
