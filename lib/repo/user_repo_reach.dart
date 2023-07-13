

import 'dart:convert';


import 'package:dio/dio.dart' as r;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import '../model/login_model.dart';
import '../model/user_model_reach.dart';
import '../ser/api.dart';
import '../widget/const.dart';



class UserRepo{
  ApiQuery apiQuery = ApiQuery();
  //UserRepo userRepo =UserRepo();

  // ignore: constant_identifier_names
  static const String IS_USER_LOGGED_IN = "IS_USER_LOGGED_IN";

  // ignore: constant_identifier_names
  static const String USER_LOGIN_RESPONSE = "USER_LOGIN_RESPONSE";

  // ignore: constant_identifier_names
  static const String USER_DETAILS = "USER_DETAILS";


  Future<r.Response?> logOut() async {
    try {
      r.Response? response =
      await apiQuery.logoutQuery(Constants.userLogout, 'LogoutApi');
      return response;
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  //login inspector
  Future<r.Response?> loginUser(String emailId, String password,String role) async {
    try {

      Map<String, String> data = {
        "email": emailId,
        "password": password,
        "role":role
      };

      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      print(data);

      r.Response? response = await apiQuery.postQuery(
          Constants.userLogin, headers, data, 'UserLoginApi');
      print(response!.data);
      print(response.statusMessage);
      print(response.statusCode);

      return response;
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future<r.Response?>forgotPassword(String email)async{
    try{
      Map<String, String> data = {
        "email": email,
      };
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      r.Response? response = await apiQuery.postQuery(
          Constants.forgot, headers, data, 'forgot');
      return response;
    }catch(ex){
      Exception(ex);
    }
    return null;
  }

  Future<r.Response?> resendMail(String email)async{
    try{
      Map<String, String> data = {
        "email": email,
      };
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      r.Response? response = await apiQuery.postQuery(
          Constants.verifyEmail, headers, data, 'forgot');
      return response;
    }catch(ex){
      Exception(ex);
    }
    return null;
  }

  Future<r.Response?>otpVeritication(String email, String otp)async{
    try{
      Map<String, String>data={
        "email":email,
        "otp":otp
      };
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      r.Response? response = await apiQuery.putQuery(
          Constants.forgot, headers, data, 'UserLoginApi');
      return response;
    }catch(ex){Exception(ex);}
    return null;
  }

  Future<r.Response?>setNewPassword(String email, String password,String token)async{
    try{
      Map<String, String>data={
        "email":email,
        "password":password,
        "token":token,
        "role":"USER"
      };
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      r.Response? response = await apiQuery.patchQuery(
          Constants.forgot, headers, data, 'setNew');
      return response;
    }catch(ex){Exception(ex);}
    return null;
  }

  Future<r.Response?> getUserDetails() async{
    try{

      // String token;
      // LoginModel? responseModel = await getUserLoginResponse();
      // token=responseModel!.jwtAccessToken;

      Map<String, dynamic> data = {};
      //print(data);

      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        // 'Authorization':'Bearer $token',
      };

      r.Response? response = await apiQuery.getQuery(Constants.userapi, headers, data, 'getUserApi', false, true, true);

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {
        // token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token',
        };

        r.Response? response = await apiQuery.getQuery(
            Constants.userapi,
            headers2,
            data,
            'getUserApi',
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

  Future<r.Response?> getOneUser(String? UserID) async{
    try{

      String token;
      LoginModel? responseModel = await getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      Map<String, dynamic> data = {};
      // if(cardID!=null){
      //   data['cardId']=cardID;
      // }
      //print(data);

      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        'Authorization':'Bearer $token',

      };

      r.Response? response = await apiQuery.getQuery(Constants.userapi+"/$UserID", headers, data, 'getOneUser', false, true, true);

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {
        token=responseModel!.jwtAccessToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          'Authorization':'Bearer $token',
        };

        r.Response? response = await apiQuery.getQuery(
            Constants.userapi+"/$UserID",
            headers2,
            data,
            'getOneUser',
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

  Future<r.Response?> getScannedImage(String? userId) async{
    try{
      String token;
      LoginModel? responseModel = await getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      Map<String, dynamic> data = {};
      //print(data);

      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        'Authorization':'Bearer $token',
      };

      r.Response? response = await apiQuery.getQuery(Constants.scannedCards, headers, data, 'getScannedCards', false, true, true);

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {
        token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          'Authorization':'Bearer $token',
        };

        r.Response? response = await apiQuery.getQuery(
            Constants.scannedCards,
            headers2,
            data,
            'getScannedCards',
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

  Future<r.Response?> createUser(File photoUrl,String firstName,String lastName,String email,String phoneNumber,String userType,String designation ,String role)async{
    try{

      // String token;
      // LoginModel? responseModel = await getUserLoginResponse();
      // token=responseModel!.jwtAccessToken;

      MultipartFile? imageFile;
      var image= File(photoUrl.path);
      // var lImage=File(logo.path);
      imageFile= await MultipartFile.fromFile(image.path,filename: "arun.jpg");
      // logoImage=await MultipartFile.fromFile(lImage.path,filename: "rearimage",);

      String password="ROV@001#";

      Map<String,dynamic> data ={
        // "logoUrl":logoImage,
        "firstName":firstName,
        "photoUrl": imageFile,
        "lastName":lastName,
        "password":password,
        "email":email,
        "phone":phoneNumber,
        "accountType":userType,
        "designation":designation,
        "role":role
      };

      FormData formData = FormData.fromMap(data);


      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        //'Authorization':'Bearer $token',
      };

      r.Response? response= await apiQuery.postQuery(Constants.userapi, headers, formData, 'createUser');

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {

        //token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          //'Authorization':'Bearer $token',
        };

        r.Response? response= await apiQuery.postQuery(Constants.userapi, headers2, formData, 'createUser');

        return response;
      }else{
        return response;
      }
    }catch (exception) {
      print(exception.toString());
      return null;
    }

  }

  Future<r.Response?> updateUser(String userID,String password) async {
    try {

      // String token;
      // LoginModel? responseModel = await getUserLoginResponse();
      // token=responseModel!.jwtAccessToken;

      Map<String, dynamic> data = {
        "password":password,

      };
      print(userID);


      Map<String, String> headers = {
        'Content-Type': 'application/json',
        // 'Authorization':'Bearer $token',

      };

      print(data);
      FormData formData = FormData.fromMap(data);

      r.Response? response = await apiQuery.putQuery(
          Constants.userapi+"/$userID", headers, formData, 'updateUser');


      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )){
        // token=responseModel!.jwtRefreshToken;

        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          // 'Authorization':'Bearer $token',
        };

        //print(data);

        r.Response? response = await apiQuery.putQuery(
            Constants.userapi+"/$userID", headers2, formData, 'updateUser');

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

  Future<r.Response?> updateUserPhoto(String userID,File proImage) async {
    try {

      String token;
      LoginModel? responseModel = await getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      MultipartFile? proimage;
      var pImage=File(proImage.path);
      proimage=await MultipartFile.fromFile(pImage.path,filename: "frontimage",);

      Map<String, dynamic> data = {
        "photoUrl":proimage,
      };
      print(userID);


      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization':'Bearer $token',

      };

      print(data);
      FormData formData = FormData.fromMap(data);

      r.Response? response = await apiQuery.putQuery(
          Constants.userapi+"/$userID", headers, formData, 'updateUser');
      print(response!.data);
      print(response.statusMessage);
      print(response.statusCode);

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )){
        token=responseModel!.jwtRefreshToken;

        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          'Authorization':'Bearer $token',
        };

        //print(data);

        r.Response? response = await apiQuery.putQuery(
            Constants.userapi+"/$userID", headers2, formData, 'updateUser');

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

  Future<r.Response?>forgotPasswordSendEmail(String emailID)async{
    try{

      String token;
      LoginModel? responseModel = await getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      Map<String, String>data={
        "email":emailID
      };
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization':'Bearer $token',
      };
      r.Response? response=await apiQuery.postQuery(Constants.forgotPassword, headers, data, "forgot-password");

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {
        token = responseModel!.jwtRefreshToken;

        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        r.Response? response = await apiQuery.postQuery(
            Constants.forgotPassword, headers2, data, "forgot-password");
        return response;
      } else{
        return response;
      }

    }
    catch(ex){
      Exception(ex);
      return null;

    }
  }

  Future<r.Response?>blockUser(String userid,String blockedUserid)async{
    try{
      String token;
      LoginModel? responseModel = await getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      Map<String, String>data={
        "usersId":userid,
        "blockingUsersId":blockedUserid
      };
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      r.Response? response=await apiQuery.postQuery(Constants.blockedUsers, headers, data, "block-user");

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {
        token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        r.Response? response=await apiQuery.postQuery(Constants.blockedUsers, headers2, data, "block-user");

        return response;
      }else{
        return response;
      }
    }catch(ex){
      Exception(ex);
    }
    return null;
  }

  Future<r.Response?>unblockUser(String userid,String unblockedUserid)async{
    try{

      String token;
      LoginModel? responseModel = await getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      Map<String, String>data={
        // "usersId":userid,
        // "blockingUsersId":unblockedUserid
      };
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      r.Response? response=await apiQuery.deleteQuery("${Constants.unblockedUsers}"+'/'+'$userid'+'/$unblockedUserid', headers, data, "unblock", true);

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )){
        token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };
        r.Response? response=await apiQuery.deleteQuery("${Constants.unblockedUsers}"+'/'+'$userid'+'/$unblockedUserid', headers2, data, "unblock", true);

        return response;
      }
      else{
        return response;
      }
    }catch(ex){
      Exception(ex);
    }
    return null;
  }

  Future<r.Response?> addDoc(String userId,File doc)async{
    try{

      String token;
      LoginModel? responseModel = await getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      MultipartFile? docFile;
      var docum= File(doc.path);
      docFile= await MultipartFile.fromFile(docum.path,filename: "doc.jpg");



      Map<String,dynamic> data ={
        "documentsUrl":docFile,
        "usersId": userId,
      };

      FormData formData = FormData.fromMap(data);


      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      r.Response? response= await apiQuery.postQuery(Constants.companyProfile, headers, formData, 'adddoc');

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {
        token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
        };

        r.Response? response= await apiQuery.postQuery(Constants.companyProfile, headers2, formData, 'adddoc');

        return response;
      }else{
        return response;
      }
    }catch (exception) {
      print(exception.toString());
      return null;
    }

  }


  ////////////////// shared pref //////////////////

  Future<LoginModel?> getUserLoginResponse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(USER_LOGIN_RESPONSE) == null) {
      return null;
    } else {
      String? userResponse = prefs.getString(USER_LOGIN_RESPONSE);
      return LoginModel.fromJson(json.decode(userResponse!));
    }
  }

  signOut()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    if(prefs.getString(USER_LOGIN_RESPONSE) != null) {
      prefs.remove(USER_LOGIN_RESPONSE);
    }else{
      return null;
    }
  }

  storeUserLoginResponse(LoginModel userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userProfileJson = json.encode(userData);
    prefs.setString(USER_LOGIN_RESPONSE, userProfileJson);
  }

  storeUserDetails(UserModel userData)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userProfileJson = json.encode(userData);
    prefs.setString(USER_DETAILS, userProfileJson);
  }

}