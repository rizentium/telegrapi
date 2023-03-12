import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'interfaces/response.dart';
import 'telegrapi_method_channel.dart';

abstract class TelegrapiPlatform extends PlatformInterface {
  /// Constructs a TelebotDartPlatform.
  TelegrapiPlatform() : super(token: _token);

  static final Object _token = Object();

  static TelegrapiPlatform _instance = MethodChannelTelegrapi(token: '');

  /// The default instance of [TelebotDartPlatform] to use.
  ///
  /// Defaults to [MethodChannelTelebotDart].
  static TelegrapiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TelebotDartPlatform] when
  /// they register themselves.
  static set instance(TelegrapiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Response> sendMessage({
    required String chatId,
    required String message,
  }) {
    throw UnimplementedError('sendMessage is not implemented yet.');
  }
}
