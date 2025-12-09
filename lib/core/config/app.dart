import 'package:e_rtlh_mobile/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../routes/app_routes.dart';
import '../global/inital_binding.dart';
import 'falvor_config.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: FlavorConfig.title,
      theme: mainTheme(),
      initialBinding: InitialBinding(),
      initialRoute: AppRoutes.SPLASHSCREEN,
      getPages: AppPages.pages,
      
      debugShowCheckedModeBanner:
          FlavorConfig.appFlavor == Flavor.prod ? false : true,
    );
  }
}
