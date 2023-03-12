
import 'telegrapi_platform_interface.dart';

class Telegrapi {
  Future<String?> getPlatformVersion() {
    return TelegrapiPlatform.instance.getPlatformVersion();
  }
}
