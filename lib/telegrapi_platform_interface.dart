import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'telegrapi_method_channel.dart';

abstract class TelegrapiPlatform extends PlatformInterface {
  /// Constructs a TelegrapiPlatform.
  TelegrapiPlatform() : super(token: _token);

  static final Object _token = Object();

  static TelegrapiPlatform _instance = MethodChannelTelegrapi();

  /// The default instance of [TelegrapiPlatform] to use.
  ///
  /// Defaults to [MethodChannelTelegrapi].
  static TelegrapiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TelegrapiPlatform] when
  /// they register themselves.
  static set instance(TelegrapiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
