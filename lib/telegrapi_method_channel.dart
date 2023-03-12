import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'telegrapi_platform_interface.dart';

/// An implementation of [TelegrapiPlatform] that uses method channels.
class MethodChannelTelegrapi extends TelegrapiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('telegrapi');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
