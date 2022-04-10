class Token {
  Tokens? tokens;

  Token(this.tokens);

  Token.fromJson(Map<String, dynamic> json) {
    tokens = json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tokens != null) {
      data['tokens'] = tokens!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Token{tokens: ${tokens.toString()}}';
  }
}

class Tokens {
  Access? access;
  Access? refresh;

  Tokens({this.access, this.refresh});

  Tokens.fromJson(Map<String, dynamic> json) {
    access = json['access'] != null ? Access.fromJson(json['access']) : null;
    refresh = json['refresh'] != null ? Access.fromJson(json['refresh']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (access != null) {
      data['access'] = access!.toJson();
    }
    if (refresh != null) {
      data['refresh'] = refresh!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Tokens{access: ${access!.toString()}, refresh: ${refresh!.toString()}}';
  }
}

class Access {
  String? token;

  Access(this.token);

  Access.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }

  @override
  String toString() {
    return 'Access{token: $token}';
  }
}
