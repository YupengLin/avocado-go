import 'package:avocado_go/frameworks/avocadogo/services/avocado_mixin.dart';
import 'package:avocado_go/services/service_config.dart';

class Services with ConfigMixin, AvocadoMixin {
  static final Services _instance = Services._internal();

  factory Services() => _instance;

  Services._internal();

  /// using BaseFirebaseServices when disable the Firebase
  // final firebase = BaseFirebaseServices();

}
