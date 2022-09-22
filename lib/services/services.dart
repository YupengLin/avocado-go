import '../common/config.dart';
import '../common/constants.dart';

class Services {
  static final Services _instance = Services._internal();

  factory Services() => _instance;

  Services._internal();

  /// using BaseFirebaseServices when disable the Firebase
  // final firebase = BaseFirebaseServices();

}
