// To parse this JSON data, do
//
//     final cardsModel = cardsModelFromJson(jsonString);

import 'dart:convert';

CardsModel cardsModelFromJson(String str) => CardsModel.fromJson(json.decode(str));

String cardsModelToJson(CardsModel data) => json.encode(data.toJson());

class CardsModel {
  List<Card> cards;
  String message;

  CardsModel({
    required this.cards,
    required this.message,
  });

  factory CardsModel.fromJson(Map<String, dynamic> json) => CardsModel(
    cards: List<Card>.from(json["cards"].map((x) => Card.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "cards": List<dynamic>.from(cards.map((x) => x.toJson())),
    "message": message,
  };
}

class Card {
  String cardId;
  String fullName;
  String phone;
  String email;
  String? font;
  String? color;
  String? website;
  String? instagram;
  String? whatsapp;
  String? facebook;
  String? twitter;
  String description;
  String address;
  String? cardImageUrl;
  String? designation;
  String? logoUrl;
  String? photoUrl;
  DateTime createdAt;
  DateTime updatedAt;
  String backgroundImageId;
  String cardType;
  String? usersId;
  CardImages cardImages;
  Users? users;

  Card({
    required this.cardId,
    required this.fullName,
    required this.phone,
    required this.email,
    this.font,
    this.color,
    this.website,
    this.instagram,
    this.whatsapp,
    this.facebook,
    this.twitter,
    required this.description,
    required this.address,
    this.cardImageUrl,
    this.designation,
    this.logoUrl,
    this.photoUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.backgroundImageId,
    required this.cardType,
    this.usersId,
    required this.cardImages,
    this.users,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    cardId: json["cardId"],
    fullName: json["fullName"],
    phone: json["phone"],
    email: json["email"],
    font: json["font"],
    color: json["color"],
    website: json["website"],
    instagram: json["instagram"],
    whatsapp: json["whatsapp"],
    facebook: json["facebook"],
    twitter: json["twitter"],
    description: json["description"]??"",
    address: json["address"]??"",
    cardImageUrl: json["cardImageUrl"],
    designation: json["designation"],
    logoUrl:json["logoUrl"] ,
    photoUrl:json["photoUrl"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    backgroundImageId: json["backgroundImageId"],
    cardType: json["cardType"],
    usersId: json["usersId"],
    cardImages: CardImages.fromJson(json["cardImages"]),
    users: json["users"] == null ? null : Users.fromJson(json["users"]),
  );

  Map<String, dynamic> toJson() => {
    "cardId": cardId,
    "fullName": fullName,
    "phone": phone,
    "email": email,
    "font": font,
    "color": color,
    "website": website,
    "instagram": instagram,
    "whatsapp": whatsapp,
    "facebook": facebook,
    "twitter": twitter,
    "description": description,
    "address": address,
    "cardImageUrl": cardImageUrl,
    "designation": designation,
    "logoUrl": logoUrl,
    "photoUrl": photoUrl,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "backgroundImageId": backgroundImageId,
    "cardType": cardType,
    "usersId": usersId,
    "cardImages": cardImages.toJson(),
    "users": users?.toJson(),
  };
}

class CardImages {
  String cardImageId;
  String imageUrl;

  CardImages({
    required this.cardImageId,
    required this.imageUrl,
  });

  factory CardImages.fromJson(Map<String, dynamic> json) => CardImages(
    cardImageId: json["cardImageId"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "cardImageId": cardImageId,
    "imageUrl": imageUrl,
  };
}

class Users {
  String usersId;
  String? logoUrl;
  String? photoUrl;

  Users({
    required this.usersId,
    this.logoUrl,
    this.photoUrl,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    usersId: json["usersId"],
    logoUrl: json["logoUrl"],
    photoUrl: json["photoUrl"],
  );

  Map<String, dynamic> toJson() => {
    "usersId": usersId,
    "logoUrl": logoUrl,
    "photoUrl": photoUrl,
  };
}
