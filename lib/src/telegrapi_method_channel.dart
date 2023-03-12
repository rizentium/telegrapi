import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:telegrapi/src/interfaces/response.dart';

import 'telegrapi_platform_interface.dart';

/// An implementation of [TelebotDartPlatform] that uses method channels.
class MethodChannelTelegrapi extends TelegrapiPlatform {
  final String token;
  final String? urlPath;

  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('telegrapi');

  MethodChannelTelegrapi({
    required this.token,
    this.urlPath,
  });

  @override
  Future<Response> sendMessage({
    required String chatId,
    required String message,
  }) async {
    if (urlPath == null) throw Exception('urlPath is not defined.');

    final uri = Uri.parse(
      '$urlPath/$token/sendMessage?chat_id=$chatId&&text=$message',
    );

    final request = await http.post(uri);
    final response = Response.fromJson(jsonDecode(request.body));
    if (!response.ok) {
      throw Exception([response.errorCode, response.description]);
    }

    return response;
  }
}
