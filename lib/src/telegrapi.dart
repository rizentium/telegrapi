import 'package:telegrapi/src/interfaces/response.dart';
import 'package:telegrapi/src/telegrapi_method_channel.dart';
import 'package:telegrapi/src/telegrapi_platform_interface.dart';

class Telegrapi {
  final TelegrapiPlatform _delegate;

  Telegrapi._(TelegrapiPlatform platform) : _delegate = platform;

  static Telegrapi initialize({
    required String token,
    String urlPath = 'https://api.telegram.org',
  }) {
    final channel = MethodChannelTelegrapi(token: token, urlPath: urlPath);
    return Telegrapi._(channel);
  }

  Future<Response> sendMessage({
    required String chatId,
    required String message,
  }) {
    return _delegate.sendMessage(chatId: chatId, message: message);
  }
}
