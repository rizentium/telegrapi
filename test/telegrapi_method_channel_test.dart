import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:telegrapi/telegrapi_method_channel.dart';

void main() {
  MethodChannelTelegrapi platform = MethodChannelTelegrapi();
  const MethodChannel channel = MethodChannel('telegrapi');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
