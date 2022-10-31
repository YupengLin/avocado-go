import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:avocado_go/language/localizetion_services.dart';
// import 'package:avocado_go/screens/Splash_Screen/Splash_Screen.dart';
import 'Custom_BlocObserver/Custom_BlocObserver.dart';
import 'Custom_BlocObserver/notifire_clor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'services/services.dart';
import 'package:avocado_go/bottom_bar/bottom_bar.dart';

void main() async {
  await GetStorage.init();
  await ScreenUtil.ensureScreenSize();
  Services().setAppConfig(Map.from(
      {"url": "Solmar-env.eba-vxgpfxub.us-east-1.elasticbeanstalk.com"}));
  BlocOverrides.runZoned(
    () => runApp(App()),
    blocObserver: AppBlocObserver(),
  );
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final localizationController = Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return GetBuilder<LocalizationController>(
        init: localizationController,
        builder: (LocalizationController controller) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => ColorNotifier()),
            ],
            child: GetMaterialApp(
              locale: controller.currentLanguage != ''
                  ? Locale(controller.currentLanguage, '')
                  : null,
              localeResolutionCallback:
                  LocalizationService.localResolutioncallBack,
              supportedLocales: LocalizationService.supportedlocales,
              localizationsDelegates: LocalizationService.localizationsDelegate,
              debugShowCheckedModeBanner: false,
              home: bottom_Home(), //Spash_Screen(),
            ),
          );
        });
  }
}
