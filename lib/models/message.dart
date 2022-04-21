class Message{
  int? statusCode;
  String? message;

  Message(this.statusCode, this.message);

  Message.fromJson(Map map, int code)
  {
    statusCode = code;
    message = map['message'];
  }

  @override
  String toString() {
    return 'Message{statusCode: $statusCode, message: $message}';
  }
}