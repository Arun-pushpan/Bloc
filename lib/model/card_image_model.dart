// To parse this JSON data, do
//
//     final cardImageModel = cardImageModelFromJson(jsonString);

import 'dart:convert';

CardImageModel cardImageModelFromJson(String str) => CardImageModel.fromJson(json.decode(str));

String cardImageModelToJson(CardImageModel data) => json.encode(data.toJson());

class CardImageModel {
  CardImageModel({
    required this.cardImages,
  });

  List<CardImage> cardImages;

  factory CardImageModel.fromJson(Map<String, dynamic> json) => CardImageModel(
    cardImages: List<CardImage>.from(json["cardImages"].map((x) => CardImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cardImages": List<dynamic>.from(cardImages.map((x) => x.toJson())),
  };
}

class CardImage {
  CardImage({
    required this.cardImageId,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  String cardImageId;
  String imageUrl;
  DateTime createdAt;
  DateTime updatedAt;

  factory CardImage.fromJson(Map<String, dynamic> json) => CardImage(
    cardImageId: json["cardImageId"],
    imageUrl: json["imageUrl"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "cardImageId": cardImageId,
    "imageUrl": imageUrl,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
