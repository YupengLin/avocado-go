import '../../../../services/service_config.dart';
import '../../../services/index.dart';
// import '../../index.dart';
import 'avocado_go.dart';

mixin AvocadoMixin on ConfigMixin {
  @override
  void configAvocado(appConfig) {
    final avocadoService = AvocadoGoService(
      domain: appConfig['url'],
    );
    api = avocadoService;
  }
}
