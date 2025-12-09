import 'package:e_rtlh_mobile/core/config/app.dart';
import 'package:flutter/widgets.dart';

import '../global/inital_binding.dart';

void setupRunApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBinding().dependencies();

  runApp(const App());
}
