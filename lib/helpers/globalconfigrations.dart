import 'package:global_configuration/global_configuration.dart';

class GlobalConfigurationHelper {
  static void init() async {
    await GlobalConfiguration().loadFromAsset("configrations");
  }

  static dynamic getValue(String name) => GlobalConfiguration().get(name);
}
