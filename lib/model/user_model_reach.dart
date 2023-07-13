import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  List<User> users;

  UserModel({
    required this.users,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
  };
}

class User {
  String? usersId;
  String? firstName;
  String? lastName;
  String? role;
  String? email;
  String? phone;
  String? logoUrl;
  String? photoUrl;
  String? designation;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic businessId;
  String? accountType;
  Map<String, int> count;

  User({
    this.usersId,
    this.firstName,
    this.lastName,
    this.role,
    this.email,
    this.phone,
    this.logoUrl,
    this.photoUrl,
    this.designation,
    this.createdAt,
    this.updatedAt,
    this.businessId,
    this.accountType,
    required this.count,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    usersId: json["usersId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    role: json["role"],
    email: json["email"],
    phone: json["phone"],
    logoUrl: json["logoUrl"],
    photoUrl: json["photoUrl"],
    designation: json["designation"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    businessId: json["businessId"],
    accountType: json["accountType"],
    count: Map.from(json["_count"]).map((k, v) => MapEntry<String, int>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "usersId": usersId,
    "firstName": firstName,
    "lastName": lastName,
    "role": role,
    "email": email,
    "phone": phone,
    "logoUrl": logoUrl,
    "photoUrl": photoUrl,
    "designation": designation,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "businessId": businessId,
    "accountType": accountType,
    "_count": Map.from(count).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}