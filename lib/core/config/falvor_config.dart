enum Flavor {
  prod,
  dev,
}

class FlavorConfig {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'New SISCA';
      case Flavor.dev:
        return 'New SISCA Dev';
      default:
        return 'title';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.prod:
        //return 'http://10.100.36.194/E-RTLH/public';
        //return 'http://192.168.1.2/e-rtlh/public';
        return 'http://49.50.10.106:8000';
      case Flavor.dev:
        return 'http://10.100.36.194/e-rtlh/public';
      //return 'https://mobile.sanf.co.id/sanf_core_dev/public/api';
      //return 'https://mobile.sanf.co.id/sanf_core/public/api';
      default:
        return '';
    }
  }
}
