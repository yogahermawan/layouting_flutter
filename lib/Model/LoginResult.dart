import 'dart:convert';

LoginResult loginResultFromJson(String str) => LoginResult.fromJson(json.decode(str));

String loginResultToJson(LoginResult data) => json.encode(data.toJson());

class LoginResult {
  String status;
  String code;
  String message;

  LoginResult({this.code,this.status, this.message});

  factory LoginResult.fromJson(Map<String, dynamic> json) => new LoginResult(
    code: json['json'],
    status: json['status'],
    message: json['message'],
  );

  Map<String, dynamic> toJson() => {
    "code":code,
    "status": status,
    "message": message,  
  };
}
