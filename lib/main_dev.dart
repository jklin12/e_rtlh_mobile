
import 'package:e_rtlh_mobile/core/config/setup_run_app.dart';

import 'core/config/falvor_config.dart';


void main() async {
  FlavorConfig.appFlavor = Flavor.prod;
  setupRunApp();
}
