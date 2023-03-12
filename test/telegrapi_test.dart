import 'package:flutter_test/flutter_test.dart';
import 'package:telegrapi/src/interfaces/response.dart';
import 'package:telegrapi/src/telegrapi_method_channel.dart';
import 'package:telegrapi/src/telegrapi_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:telegrapi/telegrapi.dart';

class MockTelegrapiPlatform
    with MockPlatformInterfaceMixin
    implements TelegrapiPlatform {
  @override
  Future<Response> sendMessage({
    required String chatId,
    required String message,
  }) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}

void main() {
  final TelegrapiPlatform initialPlatform = TelegrapiPlatform.instance;

  test('$MethodChannelTelegrapi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTelegrapi>());
  });

  test('sendMessage', () async {});
}
