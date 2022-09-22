part of '../config.dart';

/// Default app config, it's possible to set as URL
// String get kAppConfig => Configurations.appConfig;

AdvancedConfig get kAdvanceConfig =>
    AdvancedConfig.fromJson(Configurations.advanceConfig);
