

import 'package:dio/dio.dart';

import 'dart:io';
import '../model/login_model.dart';
import '../ser/api.dart';
import '../widget/const.dart';
import 'user_repo_reach.dart';

class GalleryRepo{
  ApiQuery apiQuery = ApiQuery();
  UserRepo userRepo =UserRepo();

  Future<Response?> getGalleyData() async{
    try{

      String token;
      LoginModel? responseModel = await userRepo.getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      Map<String, dynamic> data = {};
      //print(data);

      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        'Authorization':'Bearer $token',
      };

      Response? response = await apiQuery.getQuery(Constants.gallery, headers, data, 'getimages', false, true, true);

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {
        token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          'Authorization':'Bearer $token',
        };

        Response? response = await apiQuery.getQuery(
            Constants.gallery,
            headers2,
            data,
            'getimages',
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

  Future<Response?> postGalleryImage(File imageUrl, String? usersId,)async{
    try{

      String token;
      LoginModel? responseModel = await userRepo.getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      MultipartFile? imageFile;
      var image= File(imageUrl.path);
      imageFile= await MultipartFile.fromFile(image.path,filename: "arun.jpg");

      Map<String,dynamic> data ={
        "imageUrl":imageFile,
        "usersId":usersId,

      };

      FormData formData = FormData.fromMap(data);

      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        'Authorization':'Bearer $token',
      };

      Response? response= await apiQuery.postQuery(Constants.gallery, headers, formData, 'postImage');

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {

        token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          'Authorization':'Bearer $token',
        };

        Response? response= await apiQuery.postQuery(Constants.gallery, headers2, formData, 'postImage');

        return response;
      }else{
        return response;
      }
    }catch (exception) {
      print(exception.toString());
      return null;
    }

  }


  Future<Response?> deleteGallery(  String? galleryImagesId, String? userId,)async{
    try{

      String token;
      LoginModel? responseModel = await userRepo.getUserLoginResponse();
      token=responseModel!.jwtAccessToken;

      Map<String,dynamic> data ={

      };

      Map<String, String> headers = {};
      headers = {
        'Content-Type': 'application/json',
        'Authorization':'Bearer $token',
      };
      var url = Constants.gallery+"/$galleryImagesId";
      Response? response= await apiQuery.deleteQuery(url, headers, data, 'delete', true);

      if(response != null && (response.statusCode == 303 || response.statusCode == 401 )) {
        token=responseModel!.jwtRefreshToken;
        Map<String, String> headers2 = {};
        headers2 = {
          'Content-Type': 'application/json',
          'Authorization':'Bearer $token',
        };

        Response? response= await apiQuery.postQuery(Constants.gallery+"/$galleryImagesId", headers2, data, 'delete');

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