class Response {
  final bool ok;
  final int? errorCode;
  final String? description;
  final Result? result;

  Response({
    required this.ok,
    this.errorCode,
    this.description,
    this.result,
  });

  static Response fromJson(Map<String, dynamic> json) {
    Result? result;
    if (json['result'] != null) {
      result = Result.fromJson(json['result']);
    }
    return Response(
      ok: json['ok'],
      errorCode: json['error_code'],
      description: json['description'],
      result: result,
    );
  }
}

class Result {
  final int id;
  final int date;
  final String text;
  final ResultFrom? from;
  final Chat? chat;

  Result({
    required this.id,
    required this.date,
    required this.text,
    this.from,
    this.chat,
  });

  static Result fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['message_id'],
      date: json['date'],
      text: json['text'],
      from: ResultFrom.fromJson(json['from']),
      chat: Chat.fromJson(json['chat']),
    );
  }
}

class ResultFrom {
  final int id;
  final bool isBoot;
  final String? firstName;
  final String? username;

  ResultFrom({
    required this.id,
    required this.isBoot,
    this.firstName,
    this.username,
  });

  static ResultFrom fromJson(Map<String, dynamic> json) {
    return ResultFrom(
      id: json['id'],
      isBoot: json['is_bot'],
      firstName: json['first_name'],
      username: json['username'],
    );
  }
}

class Chat {
  final int id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? type;

  Chat({
    required this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.type,
  });

  static Chat fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      type: json['type'],
    );
  }
}
