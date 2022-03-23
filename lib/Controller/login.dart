// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.success,
    required this.data,
    required this.error,
  });

  bool success;
  Data data;
  String error;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "error": error,
  };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.roles,
    required this.permissions,
    required this.avatar,
    required this.token,
  });

  int id;
  String name;
  String email;
  List<String> roles;
  List<String> permissions;
  String avatar;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    roles: List<String>.from(json["roles"].map((x) => x)),
    permissions: List<String>.from(json["permissions"].map((x) => x)),
    avatar: json["avatar"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "roles": List<dynamic>.from(roles.map((x) => x)),
    "permissions": List<dynamic>.from(permissions.map((x) => x)),
    "avatar": avatar,
    "token": token,
  };
}
