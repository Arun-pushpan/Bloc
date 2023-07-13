import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:getbloc/repo/user_repo_reach.dart';
import 'package:getbloc/ser/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/card_model.dart';
import '../model/login_model.dart';
import '../widget/const.dart';


class CardRepo{
  ApiQuery apiQuery = ApiQuery();
  UserRepo userRepo =UserRepo();

  // ignore: constant_identifier_names
  static const String CARD_DETAILS = "CARD_DETAILS";


  Future<Response?> getCardBackgroundImage() async{
    try{

      // String token;
      // LoginModel? responseModel = await userRepo.getUserLoginResponse();
      // token=responseModel!.jwtAccessToken;

      Map<String, dynamic> data = {};
      //print(data);

      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        // 'Authorization':'Bearer $token',
      };

      Response? response = await apiQuery.getQuery(Constants.cardImages, headers, data, 'getCardImages', false, true, true);

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {


        // token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token',
        };

        Response? response = await apiQuery.getQuery(
            Constants.cardImages,
            headers2,
            data,
            'getCardImages',
            false,
            true,
            true);

        return response;
      }else{
        return response;
      }
    }catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future<Response?> getCards() async{
    try{

      // String token;
      //  LoginModel? responseModel = await userRepo.getUserLoginResponse();
      //  token=responseModel!.jwtAccessToken;

      Map<String, dynamic> data = {};
      //print(data);

      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token',
      };

      Response? response = await apiQuery.getQuery(Constants.cardapi, headers, data, 'getCards', false, true, true);

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {

        // token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token',
        };

        Response? response = await apiQuery.getQuery(
            Constants.cardapi,
            headers2,
            data,
            'getCards',
            false,
            true,
            true);

        return response;
      }else{
        return response;
      }
    }catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future<Response?> getOneCard(String? cardID) async{
    try{
      // String token;
      // LoginModel? responseModel = await userRepo.getUserLoginResponse();
      // token=responseModel!.jwtAccessToken;
      Map<String, dynamic> data = {};
      // if(cardID!=null){
      //   data['cardId']=cardID;
      // }
      //print(data);

      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token',
      };

      Response? response = await apiQuery.getQuery(Constants.cardapi+"/$cardID", headers, data, 'getOneCard', false, true, true);

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {

        // token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token',
        };

        Response? response = await apiQuery.getQuery(
            Constants.cardapi+"/$cardID",
            headers2,
            data,
            'getOneCard',
            false,
            true,
            true);

        return response;
      }else{
        return response;
      }
    }catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future<Response?> createFirstCard(String? userName, String usernum,String? useremail,String? staticImageurl,String cardType,String? userID, String cardImage,String cardStatus )async{
    try{

      // String token;
      // LoginModel? responseModel = await userRepo.getUserLoginResponse();
      // token=responseModel!.jwtAccessToken;

      Map<String,dynamic> data ={
        "fullName":userName,
        "phone":usernum,
        "email":useremail,
        "color":'0XFFFFFF',
        "cardImageUrl":staticImageurl,
        "cardType":cardType,
        "usersId":userID,
        "backgroundImageId":cardImage,
        "isDefault":cardStatus,
      };

      FormData formData = FormData.fromMap(data);

      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token',
      };

      Response? response= await apiQuery.postQuery(Constants.cardapi, headers, formData, 'createCard');

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {
        // token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token',
        };

        Response? response= await apiQuery.postQuery(Constants.cardapi, headers2, formData, 'createCard');

        return response;
      }else{
        return response;
      }
    }catch (exception) {
      print(exception.toString());
      return null;
    }

  }


  Future<Response?> createCard(
      String? userName,
      String usernum,
      String? useremail,
      String font,
      String userwebsite,
      String insta,
      String address,
      String? staticImageurl,
      String userDesignation,
      String cardType,
      String? userID,
      String cardImage,
      File proImage,
      String color,
      String facebook,
      String whatsapp,
      String twitter,
      String cardStatus
      )async{
    try{

      // String token;
      // LoginModel? responseModel = await userRepo.getUserLoginResponse();
      // token=responseModel!.jwtAccessToken;

      MultipartFile? proimage;
      var pImage=File(proImage.path);
      proimage=await MultipartFile.fromFile(pImage.path,filename: "frontimage",);


      Map<String,dynamic> data ={
        "fullName":userName,
        "phone":usernum,
        "email":useremail,
        "font":font,
        "color":color,
        "website":"https://$userwebsite/",
        "instagram":insta,
        "whatsapp":whatsapp,
        "facebook":facebook,
        "twitter":twitter,
        "description":"description",
        "address":address,
        "cardImageUrl":staticImageurl,
        "designation":userDesignation,
        "cardType":cardType,
        "usersId":userID,
        "backgroundImageId":cardImage,
        "photoUrl":proimage,
        "isDefault":cardStatus
      };

      FormData formData = FormData.fromMap(data);

      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token',
      };

      Response? response= await apiQuery.postQuery(Constants.cardapi, headers, formData, 'createCard');

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {

        // token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token',
        };

        Response? response= await apiQuery.postQuery(Constants.cardapi, headers, formData, 'createCard');

        return response;
      }else{
        return response;
      }
    }catch (exception) {
      print(exception.toString());
      return null;
    }

  }

  Future<Response?> updateUserCart([String? name,String? email,String? phone,String? cardType,String? bgImgId,String? uid,String? cardId]) async {
    try {

      String token;
      LoginModel? responseModel = await userRepo.getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      // MultipartFile? imageFile;
      // var image= File(imageUrl!.path);
      // imageFile= await MultipartFile.fromFile(image.path,filename: "rishu.jpg");

      Map<String, dynamic> data = {
        'fullName':name,
        "email":email,
        "phone":phone,
        "cardType":cardType,
        'backgroundImageId':bgImgId,
        'usersId':uid,
        //"profileImage" :imageFile,

      };
      //print(userID);

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',

      };


      FormData formData = FormData.fromMap(data);

      Response? response = await apiQuery.putQuery(
          Constants.cardapi+"/$cardId", headers, formData, 'updateCard');
      print(response!.data);
      print(response.statusMessage);
      print(response.statusCode);

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )){
        token=responseModel!.jwtAccessToken;

        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        // //print(data);

        Response? response = await apiQuery.putQuery(
            Constants.userapi+"/$cardId", headers2, formData, 'updateUser');

        return response;
      }
      else{
        return response;
      }
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future<Response?> updateCartProfileImg([String? uid,File? imageUrl]) async {
    try {

      String token;
      LoginModel? responseModel = await userRepo.getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      MultipartFile? imageFile;
      var image= File(imageUrl!.path);
      imageFile= await MultipartFile.fromFile(image.path,filename: "rishu.jpg");

      Map<String, dynamic> data = {
        "logoUrl":imageFile
      };
      //print(userID);

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',

      };

      FormData formData = FormData.fromMap(data);

      Response? response = await apiQuery.putQuery(
          Constants.cardapi+"/$uid", headers, formData, 'updateCardProfileImage');
      print(response!.data);
      print(response.statusMessage);
      print(response.statusCode);

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )){
        token=responseModel!.jwtAccessToken;

        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        //print(data);

        Response? response = await apiQuery.putQuery(
            Constants.userapi+"/$uid", headers2, formData, 'updateCardProfileImage');

        return response;
      }
      else{
        return response;
      }
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future<Response?> sendCard(String? senderId, String? receiverId,String? cardId )async{
    try{

      String token;
      LoginModel? responseModel = await userRepo.getUserLoginResponse();
      token=responseModel!.jwtAccessToken;


      Map<String,dynamic> data ={
        "senderUserId":senderId,
        "receiverUserId":receiverId,
        "cardId":cardId,
      };


      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      Response? response= await apiQuery.postQuery(Constants.shareCard, headers, data, 'shareCard');

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {
        token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        Response? response= await apiQuery.postQuery(Constants.shareCard, headers2, data, 'shareCard');

        return response;
      }else{
        return response;
      }
    }catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future<Response?> getSharedCards(String? userId) async{
    try{

      String token;
      LoginModel? responseModel = await userRepo.getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      Map<String, dynamic> data = {};
      // if(cardID!=null){
      //   data['cardId']=cardID;
      // }
      //print(data);

      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      Response? response = await apiQuery.getQuery(Constants.shareCard+'?senderUserId=$userId', headers, data, 'getOneCard', false, true, true);

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {
        token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        Response? response = await apiQuery.getQuery(
            Constants.shareCard+'?senderUserId=$userId',
            headers2,
            data,
            'getOneCard',
            false,
            true,
            true);

        return response;
      }else{
        return response;
      }
    }catch (exception) {
      print(exception.toString());
      return null;
    }
  }


  Future<Card?> getCardDetailsLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(CARD_DETAILS) == null) {
      return null;
    } else {
      String? userResponse = prefs.getString(CARD_DETAILS);
      return Card.fromJson(json.decode(userResponse!));
    }
  }

  Future<Response?> deleteCard(String? cardID) async{
    try{

      String token;
      LoginModel? responseModel = await userRepo.getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      Map<String, dynamic> data = {};

      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      Response? response = await apiQuery.deleteQuery(Constants.cardapi+"/$cardID", headers, data, 'deleteCard', true);

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {
        token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        Response? response = await apiQuery.deleteQuery(
            Constants.cardapi+"/$cardID",
            headers2,
            data,
            'deleteCard',
            true);

        return response;
      }else{
        return response;
      }
    }catch (exception) {
      print(exception.toString());
      return null;
    }
  }
  /*String routeurl='/cards';
  Future<Response?>updateDefaultCard(cardId,String isdeflt)async{
    Dio dio=Dio();
    try {
      final String url='http://13.232.99.199/dev/api/v1$routeurl/$cardId';
      FormData formData=FormData.fromMap({"isDefault":isdeflt});
      Response response=await dio.put(url,data: formData);
      return response;

    } catch (e) {
      throw Exception(e.toString());
    }
  }*/

  Future<Response?>updateDefaultCard(cardId,String isdeflt)async{
    try {

      String token;
      LoginModel? responseModel = await userRepo.getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      Map<String, dynamic> data = {
        "isDefault":isdeflt
      };

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',

      };

      FormData formData = FormData.fromMap(data);

      Response? response = await apiQuery.putQuery(
          Constants.cardapi+"/$cardId", headers, formData, 'updateCardProfileImage');



      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )){
        token=responseModel!.jwtRefreshToken;

        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        //print(data);

        Response? response = await apiQuery.putQuery(
            Constants.cardapi+"/$cardId", headers2, formData, 'updateCardProfileImage');

        return response;
      }
      else{
        return response;
      }

    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response?> getPosition() async{
    try{
      String token;
      LoginModel? responseModel = await userRepo.getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      Map<String, dynamic> data = {};
      //print(data);

      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      Response? response = await apiQuery.getQuery(Constants.Position, headers, data, 'getPosition', false, true, true);

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {
        token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        Response? response = await apiQuery.getQuery(
            Constants.Position,
            headers2,
            data,
            'getPosition',
            false,
            true,
            true);

        return response;
      }else{
        return response;
      }
    }catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future<Response?> addPosition(String cardId,String type,double x,double y) async {
    try {

      String token;
      LoginModel? responseModel = await userRepo.getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      Map<String, dynamic> data = {
        "cardId":cardId,
        "type":type,
        "x":x,
        "y":y

      };
      //print(userID);

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',

      };

      Response? response = await apiQuery.postQuery(
          Constants.Position, headers, data, 'addPosition');

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )){
        token=responseModel!.jwtAccessToken;

        Map<String, String> headers2 = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',

        };

        Response? response = await apiQuery.postQuery(
            Constants.Position, headers2, data, 'addPosition');

        return response;

      }
      else{
        return response;
      }
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future<Response?> updatePosition(String cardId,String type,double x,double y) async {
    try {

      String token;
      LoginModel? responseModel = await userRepo.getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      Map<String, dynamic> data = {
        "type":type,
        "x":x,
        "y":y

      };
      //print(userID);

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',

      };

      Response? response = await apiQuery.putQuery(
          Constants.Position+"/$cardId", headers, data, 'updatePosition');

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )){
        token=responseModel!.jwtRefreshToken;

        Map<String, String> headers2 = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',

        };

        Response? response = await apiQuery.putQuery(
            Constants.Position+"/$cardId", headers2, data, 'updatePosition');

        return response;

      }
      else{
        return response;
      }
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }




  storeCardDetails( Card userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userProfileJson = json.encode(userData);
    prefs.setString(CARD_DETAILS, userProfileJson);
  }


  Future<Response?> UpdateCard(
      String CardId,
      String? userName,
      String usernum,
      String? useremail,
      String font,
      String userwebsite,
      String insta,
      String address,
      String? staticImageurl,
      String userDesignation,
      String cardType,
      String? userID,
      String cardImage,
      String color,
      String facebook,
      String whatsapp,
      String twitter,
      String cardStatus
      )async{
    try{

      // String token;
      // LoginModel? responseModel = await userRepo.getUserLoginResponse();
      // token=responseModel!.jwtAccessToken;

      // MultipartFile? proimage;
      // var pImage=File(proImage.path);
      // proimage=await MultipartFile.fromFile(pImage.path,filename: "frontimage",);


      Map<String,dynamic> data ={
        "fullName":userName,
        "phone":usernum,
        "email":useremail,
        "font":font,
        "color":color,
        "website":"https://$userwebsite/",
        "instagram":insta,
        "whatsapp":whatsapp,
        "facebook":facebook,
        "twitter":twitter,
        "address":address,
        "designation":userDesignation,
      };

      FormData formData = FormData.fromMap(data);

      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token',
      };

      Response? response= await apiQuery.putQuery(Constants.cardapi+"/$CardId", headers, formData, 'updateCard');

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {

        // token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token',
        };

        Response? response= await apiQuery.putQuery(Constants.cardapi+"/$CardId", headers2, formData, 'updateCard');

        return response;
      }else{
        return response;
      }
    }catch (exception) {
      print(exception.toString());
      return null;
    }

  }


  Future<Response?> putCardImg(
      String CardId,
      File proimage,
      )async{
    try{

      MultipartFile? image;
      var pImage=File(proimage.path);
      image =await MultipartFile.fromFile(pImage.path,filename: "frontimage",);


      Map<String,dynamic> data ={
        "photoUrl":image
      };

      FormData formData = FormData.fromMap(data);

      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token',
      };

      Response? response= await apiQuery.putQuery(Constants.cardapi+"/$CardId", headers, formData, 'updateCard');

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {

        // token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token',
        };

        Response? response= await apiQuery.putQuery(Constants.cardapi+"/$CardId", headers2, formData, 'updateCard');

        return response;
      }else{
        return response;
      }
    }catch (exception) {
      print(exception.toString());
      return null;
    }

  }



}