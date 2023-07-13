// To parse this JSON data, do
//
//     final oneUserModel = oneUserModelFromJson(jsonString);

import 'dart:convert';

OneUserModel oneUserModelFromJson(String str) => OneUserModel.fromJson(json.decode(str));

String oneUserModelToJson(OneUserModel data) => json.encode(data.toJson());

class OneUserModel {
  Users users;

  OneUserModel({
    required this.users,
  });

  factory OneUserModel.fromJson(Map<String, dynamic> json) => OneUserModel(
    users: Users.fromJson(json["users"]),
  );

  Map<String, dynamic> toJson() => {
    "users": users.toJson(),
  };
}

class Users {
  String? firstName;
  String? lastName;
  String? photoUrl;
  String? logoUrl;
  String? role;
  String? email;
  String? phone;
  String? designation;
  List<ProfileRating>? profileRating;
  List<Card>? cards;
  List<Catalogue>? catalogue;
  List<CompanyDocument>? companyDocuments;
  List<Profile>? profile;
  List<ScannedCard>? scannedCards;
  List<CallReminder>? callReminders;
  List<GalleryImage>? galleryImages;
  List<VideoProfile>? videoProfile;
  String? accountType;
  List<SendCard>? sendCards;
  List<dynamic>? blockedByMe;
  List<BlockedMe>? blockedMe;
  List<ReceivedCard>? receivedCards;

  Users({
    this.firstName,
    this.lastName,
    this.photoUrl,
    this.logoUrl,
    this.role,
    this.email,
    this.phone,
    this.designation,
    this.profileRating,
    this.cards,
    this.catalogue,
    this.companyDocuments,
    this.profile,
    this.scannedCards,
    this.callReminders,
    this.galleryImages,
    this.videoProfile,
    this.accountType,
    this.sendCards,
    this.blockedByMe,
    this.blockedMe,
    this.receivedCards,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    firstName: json["firstName"],
    lastName: json["lastName"],
    photoUrl: json["photoUrl"],
    logoUrl: json["logoUrl"],
    role: json["role"],
    email: json["email"],
    phone: json["phone"],
    designation: json["designation"],
    profileRating: List<ProfileRating>.from(json["profileRating"].map((x) => ProfileRating.fromJson(x))),
    cards: List<Card>.from(json["cards"].map((x) => Card.fromJson(x))),
    catalogue: List<Catalogue>.from(json["catalogue"].map((x) => Catalogue.fromJson(x))),
    companyDocuments: List<CompanyDocument>.from(json["companyDocuments"].map((x) => CompanyDocument.fromJson(x))),
    profile: List<Profile>.from(json["profile"].map((x) => Profile.fromJson(x))),
    scannedCards: List<ScannedCard>.from(json["scannedCards"].map((x) => ScannedCard.fromJson(x))),
    callReminders: List<CallReminder>.from(json["callReminders"].map((x) => CallReminder.fromJson(x))),
    galleryImages: List<GalleryImage>.from(json["galleryImages"].map((x) => GalleryImage.fromJson(x))),
    videoProfile: List<VideoProfile>.from(json["videoProfile"].map((x) => VideoProfile.fromJson(x))),
    accountType: json["accountType"],
    sendCards: List<SendCard>.from(json["sendCards"].map((x) => SendCard.fromJson(x))),
    blockedByMe: List<dynamic>.from(json["blockedByMe"].map((x) => x)),
    blockedMe: List<BlockedMe>.from(json["blockedMe"].map((x) => BlockedMe.fromJson(x))),
    receivedCards: List<ReceivedCard>.from(json["receivedCards"].map((x) => ReceivedCard.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "photoUrl": photoUrl,
    "logoUrl": logoUrl,
    "role": role,
    "email": email,
    "phone": phone,
    "designation": designation,
    "profileRating": List<dynamic>.from(profileRating!.map((x) => x.toJson())),
    "cards": List<dynamic>.from(cards!.map((x) => x.toJson())),
    "catalogue": List<dynamic>.from(catalogue!.map((x) => x.toJson())),
    "companyDocuments": List<dynamic>.from(companyDocuments!.map((x) => x.toJson())),
    "profile": List<dynamic>.from(profile!.map((x) => x.toJson())),
    "scannedCards": List<dynamic>.from(scannedCards!.map((x) => x.toJson())),
    "callReminders": List<dynamic>.from(callReminders!.map((x) => x.toJson())),
    "galleryImages": List<dynamic>.from(galleryImages!.map((x) => x.toJson())),
    "videoProfile": List<dynamic>.from(videoProfile!.map((x) => x.toJson())),
    "accountType": accountType,
    "sendCards": List<dynamic>.from(sendCards!.map((x) => x.toJson())),
    "blockedByMe": List<dynamic>.from(blockedByMe!.map((x) => x)),
    "blockedMe": List<dynamic>.from(blockedMe!.map((x) => x.toJson())),
    "receivedCards": List<dynamic>.from(receivedCards!.map((x) => x.toJson())),
  };
}

class BlockedMe {
  String usersId;
  String firstName;
  String lastName;
  String? photoUrl;
  String? logoUrl;
  String role;
  String email;
  String phone;
  String? designation;

  BlockedMe({
    required this.usersId,
    required this.firstName,
    required this.lastName,
    this.photoUrl,
    this.logoUrl,
    required this.role,
    required this.email,
    required this.phone,
    this.designation,
  });

  factory BlockedMe.fromJson(Map<String, dynamic> json) => BlockedMe(
    usersId: json["usersId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    photoUrl: json["photoUrl"],
    logoUrl: json["logoUrl"],
    role: json["role"],
    email: json["email"],
    phone: json["phone"],
    designation: json["designation"],
  );

  Map<String, dynamic> toJson() => {
    "usersId": usersId,
    "firstName": firstName,
    "lastName": lastName,
    "photoUrl": photoUrl,
    "logoUrl": logoUrl,
    "role": role,
    "email": email,
    "phone": phone,
    "designation": designation,
  };
}

class Card {
  String cardId;
  String fullName;
  String phone;
  String email;
  dynamic font;
  dynamic color;
  dynamic website;
  dynamic instagram;
  dynamic whatsapp;
  dynamic facebook;
  dynamic twitter;
  dynamic description;
  dynamic address;
  dynamic cardImageUrl;
  dynamic designation;
  String? logoUrl;
  String photoUrl;
  String isDefault;
  DateTime createdAt;
  DateTime updatedAt;
  String backgroundImageId;
  String cardType;
  String usersId;
  CardImages cardImages;
  List<Position> positions;

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
    this.description,
    this.address,
    this.cardImageUrl,
    this.designation,
    this.logoUrl,
    required this.photoUrl,
    required this.isDefault,
    required this.createdAt,
    required this.updatedAt,
    required this.backgroundImageId,
    required this.cardType,
    required this.usersId,
    required this.cardImages,
    required this.positions,
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
    description: json["description"],
    address: json["address"],
    cardImageUrl: json["cardImageUrl"],
    designation: json["designation"],
    logoUrl: json["logoUrl"],
    photoUrl: json["photoUrl"]??"",
    isDefault: json["isDefault"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    backgroundImageId: json["backgroundImageId"],
    cardType: json["cardType"],
    usersId: json["usersId"],
    cardImages: CardImages.fromJson(json["cardImages"]),
    positions: List<Position>.from(json["positions"].map((x) => Position.fromJson(x))),
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
    "isDefault": isDefault,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "backgroundImageId": backgroundImageId,
    "cardType": cardType,
    "usersId": usersId,
    "cardImages": cardImages.toJson(),
    "positions": List<dynamic>.from(positions.map((x) => x.toJson())),
  };
}

class CardImages {
  String imageUrl;
  String cardImageId;

  CardImages({
    required this.imageUrl,
    required this.cardImageId,
  });

  factory CardImages.fromJson(Map<String, dynamic> json) => CardImages(
    imageUrl: json["imageUrl"],
    cardImageId: json["cardImageId"],
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl,
    "cardImageId": cardImageId,
  };
}

class Position {
  String positionsId;
  String type;
  String x;
  String y;

  Position({
    required this.positionsId,
    required this.type,
    required this.x,
    required this.y,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
    positionsId: json["positionsId"],
    type: json["type"],
    x: json["x"],
    y: json["y"],
  );

  Map<String, dynamic> toJson() => {
    "positionsId": positionsId,
    "type": type,
    "x": x,
    "y": y,
  };
}

class Catalogue {
  String catalogueId;
  String title;
  int? price;
  String? description;
  List<ProductDetail> productDetails;
  DateTime createdAt;
  DateTime updatedAt;
  String usersId;
  List<CatalogueImage>? catalogueImages;

  Catalogue({
    required this.catalogueId,
    required this.title,
    this.price,
    this.description,
    required this.productDetails,
    required this.createdAt,
    required this.updatedAt,
    required this.usersId,
    this.catalogueImages,
  });

  factory Catalogue.fromJson(Map<String, dynamic> json) => Catalogue(
    catalogueId: json["catalogueId"],
    title: json["title"],
    price: json["price"] ,
    description: json["description"],
    productDetails: List<ProductDetail>.from(json["productDetails"].map((x) => ProductDetail.fromJson(x))),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    usersId: json["usersId"],
    catalogueImages: List<CatalogueImage>.from(json["catalogueImages"].map((x) => CatalogueImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "catalogueId": catalogueId,
    "title": title,
    "price": price,
    "description": description,
    "productDetails": List<dynamic>.from(productDetails.map((x) => x.toJson())),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "usersId": usersId,
    "catalogueImages": List<dynamic>.from(catalogueImages!.map((x) => x.toJson())),
  };
}

class CatalogueImage {
  String? imageUrl;
  String catalogueImagesId;

  CatalogueImage({
    this.imageUrl,
    required this.catalogueImagesId,
  });

  factory CatalogueImage.fromJson(Map<String, dynamic> json) => CatalogueImage(
    imageUrl: json["imageUrl"],
    catalogueImagesId: json["catalogueImagesId"],
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl,
    "catalogueImagesId": catalogueImagesId,
  };
}

class GalleryImage {
  String imageUrl;
  String galleryImagesId;

  GalleryImage({
    required this.imageUrl,
    required this.galleryImagesId,
  });

  factory GalleryImage.fromJson(Map<String, dynamic> json) => GalleryImage(
    imageUrl: json["imageUrl"],
    galleryImagesId: json["galleryImagesId"],
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl,
    "galleryImagesId": galleryImagesId,
  };
}

class Profile {
  String profileId;
  String firstName;
  String lastName;
  String alternateEmail;
  String alternatePhone;
  DateTime createdAt;
  DateTime updatedAt;
  String usersId;
  String professionsDetailsId;
  String personalDetailsId;
  Professions professions;
  PersonalDetails personalDetails;
  List<Education> education;
  List<SocialMedia> socialMedia;

  Profile({
    required this.profileId,
    required this.firstName,
    required this.lastName,
    required this.alternateEmail,
    required this.alternatePhone,
    required this.createdAt,
    required this.updatedAt,
    required this.usersId,
    required this.professionsDetailsId,
    required this.personalDetailsId,
    required this.professions,
    required this.personalDetails,
    required this.education,
    required this.socialMedia,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    profileId: json["profileId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    alternateEmail: json["alternateEmail"],
    alternatePhone: json["alternatePhone"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    usersId: json["usersId"],
    professionsDetailsId: json["professionsDetailsId"],
    personalDetailsId: json["personalDetailsId"],
    professions: Professions.fromJson(json["professions"]),
    personalDetails: PersonalDetails.fromJson(json["personalDetails"]),
    education: List<Education>.from(json["education"].map((x) => Education.fromJson(x))),
    socialMedia: List<SocialMedia>.from(json["socialMedia"].map((x) => SocialMedia.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "profileId": profileId,
    "firstName": firstName,
    "lastName": lastName,
    "alternateEmail": alternateEmail,
    "alternatePhone": alternatePhone,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "usersId": usersId,
    "professionsDetailsId": professionsDetailsId,
    "personalDetailsId": personalDetailsId,
    "professions": professions.toJson(),
    "personalDetails": personalDetails.toJson(),
    "education": List<dynamic>.from(education.map((x) => x.toJson())),
    "socialMedia": List<dynamic>.from(socialMedia.map((x) => x.toJson())),
  };
}

class Education {
  String educationId;
  String durationFrom;
  String durationTo;
  String course;
  String institute;
  String university;

  Education({
    required this.educationId,
    required this.durationFrom,
    required this.durationTo,
    required this.course,
    required this.institute,
    required this.university,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    educationId: json["educationId"],
    durationFrom: json["durationFrom"],
    durationTo: json["durationTo"],
    course: json["course"],
    institute: json["institute"],
    university: json["university"],
  );

  Map<String, dynamic> toJson() => {
    "educationId": educationId,
    "durationFrom": durationFrom,
    "durationTo": durationTo,
    "course": course,
    "institute": institute,
    "university": university,
  };
}

class PersonalDetails {
  String personalDetailsId;
  String address;
  int age;
  String bloodGroup;
  String hobbies;
  String interests;

  PersonalDetails({
    required this.personalDetailsId,
    required this.address,
    required this.age,
    required this.bloodGroup,
    required this.hobbies,
    required this.interests,
  });

  factory PersonalDetails.fromJson(Map<String, dynamic> json) => PersonalDetails(
    personalDetailsId: json["personalDetailsId"],
    address: json["address"],
    age: json["age"],
    bloodGroup: json["bloodGroup"],
    hobbies: json["hobbies"],
    interests: json["interests"],
  );

  Map<String, dynamic> toJson() => {
    "personalDetailsId": personalDetailsId,
    "address": address,
    "age": age,
    "bloodGroup": bloodGroup,
    "hobbies": hobbies,
    "interests": interests,
  };
}

class Professions {
  String professionId;
  String company;
  String designation;

  Professions({
    required this.professionId,
    required this.company,
    required this.designation,
  });

  factory Professions.fromJson(Map<String, dynamic> json) => Professions(
    professionId: json["professionId"],
    company: json["company"],
    designation: json["designation"],
  );

  Map<String, dynamic> toJson() => {
    "professionId": professionId,
    "company": company,
    "designation": designation,
  };
}

class SocialMedia {
  String socialMediaId;
  String socialMediaType;
  String socialMediaUrl;

  SocialMedia({
    required this.socialMediaId,
    required this.socialMediaType,
    required this.socialMediaUrl,
  });

  factory SocialMedia.fromJson(Map<String, dynamic> json) => SocialMedia(
    socialMediaId: json["socialMediaId"],
    socialMediaType: json["socialMediaType"],
    socialMediaUrl: json["socialMediaUrl"],
  );

  Map<String, dynamic> toJson() => {
    "socialMediaId": socialMediaId,
    "socialMediaType": socialMediaType,
    "socialMediaUrl": socialMediaUrl,
  };
}

class ProfileRating {
  String profileRatingId;
  int rating;

  ProfileRating({
    required this.profileRatingId,
    required this.rating,
  });

  factory ProfileRating.fromJson(Map<String, dynamic> json) => ProfileRating(
    profileRatingId: json["profileRatingId"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "profileRatingId": profileRatingId,
    "rating": rating,
  };
}

class ScannedCard {
  String scannedCardId;
  String frontSideUrl;
  dynamic backSideUrl;
  String fullName;
  String phoneOne;
  String phoneTwo;
  String phoneThree;
  String phoneFour;
  dynamic emailOne;
  dynamic emailTwo;
  dynamic emailThree;
  String addressOne;
  String addressTwo;
  String scannedCardsText;
  String website;
  String companyName;
  String designation;
  String cardType;
  DateTime createdAt;
  DateTime updatedAt;
  String usersId;

  ScannedCard({
    required this.scannedCardId,
    required this.frontSideUrl,
    this.backSideUrl,
    required this.fullName,
    required this.phoneOne,
    required this.phoneTwo,
    required this.phoneThree,
    required this.phoneFour,
    this.emailOne,
    this.emailTwo,
    this.emailThree,
    required this.addressOne,
    required this.addressTwo,
    required this.scannedCardsText,
    required this.website,
    required this.companyName,
    required this.designation,
    required this.cardType,
    required this.createdAt,
    required this.updatedAt,
    required this.usersId,
  });

  factory ScannedCard.fromJson(Map<String, dynamic> json) => ScannedCard(
    scannedCardId: json["scannedCardId"],
    frontSideUrl: json["frontSideUrl"],
    backSideUrl: json["backSideUrl"],
    fullName: json["fullName"],
    phoneOne: json["phoneOne"],
    phoneTwo: json["phoneTwo"],
    phoneThree: json["phoneThree"],
    phoneFour: json["phoneFour"],
    emailOne: json["emailOne"],
    emailTwo: json["emailTwo"],
    emailThree: json["emailThree"],
    addressOne: json["addressOne"],
    addressTwo: json["addressTwo"],
    scannedCardsText: json["scannedCardsText"],
    website: json["website"],
    companyName: json["companyName"],
    designation: json["designation"],
    cardType: json["cardType"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    usersId: json["usersId"],
  );

  Map<String, dynamic> toJson() => {
    "scannedCardId": scannedCardId,
    "frontSideUrl": frontSideUrl,
    "backSideUrl": backSideUrl,
    "fullName": fullName,
    "phoneOne": phoneOne,
    "phoneTwo": phoneTwo,
    "phoneThree": phoneThree,
    "phoneFour": phoneFour,
    "emailOne": emailOne,
    "emailTwo": emailTwo,
    "emailThree": emailThree,
    "addressOne": addressOne,
    "addressTwo": addressTwo,
    "scannedCardsText": scannedCardsText,
    "website": website,
    "companyName": companyName,
    "designation": designation,
    "cardType": cardType,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "usersId": usersId,
  };
}


class CallReminder {
  String callReminderId;
  String phone;
  String avatarUrl;
  String fullName;
  String time;
  String message;
  DateTime createdAt;
  DateTime updatedAt;
  String usersId;

  CallReminder({
    required this.callReminderId,
    required this.phone,
    required this.avatarUrl,
    required this.fullName,
    required this.time,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
    required this.usersId,
  });

  factory CallReminder.fromJson(Map<String, dynamic> json) => CallReminder(
    callReminderId: json["callReminderId"],
    phone: json["phone"],
    avatarUrl: json["avatarUrl"],
    fullName: json["fullName"],
    time: json["time"],
    message: json["message"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    usersId: json["usersId"],
  );

  Map<String, dynamic> toJson() => {
    "callReminderId": callReminderId,
    "phone": phone,
    "avatarUrl": avatarUrl,
    "fullName": fullName,
    "time": time,
    "message": message,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "usersId": usersId,
  };
}


class ProductDetail {
  String key;
  String value;
  String displyName;

  ProductDetail({
    required this.key,
    required this.value,
    required this.displyName,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
    key: json["key"],
    value: json["value"],
    displyName: json["displyName"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
    "displyName": displyName,
  };
}

class CompanyDocument {
  String companyDocumentsId;
  String documentsUrl;
  DateTime createdAt;
  DateTime updatedAt;
  String usersId;

  CompanyDocument({
    required this.companyDocumentsId,
    required this.documentsUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.usersId,
  });

  factory CompanyDocument.fromJson(Map<String, dynamic> json) => CompanyDocument(
    companyDocumentsId: json["companyDocumentsId"],
    documentsUrl: json["documentsUrl"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    usersId: json["usersId"],
  );

  Map<String, dynamic> toJson() => {
    "companyDocumentsId": companyDocumentsId,
    "documentsUrl": documentsUrl,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "usersId": usersId,
  };
}


class VideoProfile {
  String videoUrl;
  String videoProfileId;
  String videoStatus;

  VideoProfile({
    required this.videoUrl,
    required this.videoProfileId,
    required this.videoStatus,
  });

  factory VideoProfile.fromJson(Map<String, dynamic> json) => VideoProfile(
    videoUrl: json["videoUrl"],
    videoProfileId: json["videoProfileId"],
    videoStatus: json["videoStatus"],
  );

  Map<String, dynamic> toJson() => {
    "videoUrl": videoUrl,
    "videoProfileId": videoProfileId,
    "videoStatus": videoStatus,
  };
}

class ReceivedCard {
  String cardId;
  String sendCardsId;
  String receiverUserId;
  Card cards;
  IngUser sendingUser;

  ReceivedCard({
    required this.cardId,
    required this.sendCardsId,
    required this.receiverUserId,
    required this.cards,
    required this.sendingUser,
  });

  factory ReceivedCard.fromJson(Map<String, dynamic> json) => ReceivedCard(
    cardId: json["cardId"],
    sendCardsId: json["sendCardsId"],
    receiverUserId: json["receiverUserId"],
    cards: Card.fromJson(json["cards"]),
    sendingUser: IngUser.fromJson(json["sendingUser"]),
  );

  Map<String, dynamic> toJson() => {
    "cardId": cardId,
    "sendCardsId": sendCardsId,
    "receiverUserId": receiverUserId,
    "cards": cards.toJson(),
    "sendingUser": sendingUser.toJson(),
  };
}

class IngUser {
  String usersId;
  String firstName;
  String lastName;
  String? photoUrl;
  String? logoUrl;
  String role;
  String email;
  String phone;
  String? designation;

  IngUser({
    required this.usersId,
    required this.firstName,
    required this.lastName,
    this.photoUrl,
    this.logoUrl,
    required this.role,
    required this.email,
    required this.phone,
    this.designation,
  });

  factory IngUser.fromJson(Map<String, dynamic> json) => IngUser(
    usersId: json["usersId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    photoUrl: json["photoUrl"],
    logoUrl: json["logoUrl"],
    role: json["role"],
    email: json["email"],
    phone: json["phone"],
    designation: json["designation"],
  );

  Map<String, dynamic> toJson() => {
    "usersId": usersId,
    "firstName": firstName,
    "lastName": lastName,
    "photoUrl": photoUrl,
    "logoUrl": logoUrl,
    "role": role,
    "email": email,
    "phone": phone,
    "designation": designation,
  };
}

class SendCard {
  String cardId;
  Card cards;
  String receiverUserId;
  String sendCardsId;
  IngUser receivingUser;

  SendCard({
    required this.cardId,
    required this.cards,
    required this.receiverUserId,
    required this.sendCardsId,
    required this.receivingUser,
  });

  factory SendCard.fromJson(Map<String, dynamic> json) => SendCard(
    cardId: json["cardId"],
    cards: Card.fromJson(json["cards"]),
    receiverUserId: json["receiverUserId"],
    sendCardsId: json["sendCardsId"],
    receivingUser: IngUser.fromJson(json["receivingUser"]),
  );

  Map<String, dynamic> toJson() => {
    "cardId": cardId,
    "cards": cards.toJson(),
    "receiverUserId": receiverUserId,
    "sendCardsId": sendCardsId,
    "receivingUser": receivingUser.toJson(),
  };
}