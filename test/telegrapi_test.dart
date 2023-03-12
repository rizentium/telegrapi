import 'package:flutter_test/flutter_test.dart';
import 'package:telegrapi/telegrapi.dart';
import 'package:telegrapi/telegrapi_platform_interface.dart';
import 'package:telegrapi/telegrapi_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTelegrapiPlatform
    with MockPlatformInterfaceMixin
    implements TelegrapiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TelegrapiPlatform initialPlatform = TelegrapiPlatform.instance;

  test('$MethodChannelTelegrapi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTelegrapi>());
  });

  test('getPlatformVersion', () async {
    Telegrapi telegrapiPlugin = Telegrapi();
    MockTelegrapiPlatform fakePlatform = MockTelegrapiPlatform();
    TelegrapiPlatform.instance = fakePlatform;

    expect(await telegrapiPlugin.getPlatformVersion(), '42');
  });
}
