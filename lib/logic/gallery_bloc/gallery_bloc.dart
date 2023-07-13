import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:getbloc/model/card_image_model.dart';
import 'package:getbloc/repo/card_image_repo.dart';


import '../../model/gallery_model.dart';
import '../../model/login_model.dart';
import '../../repo/gallery_repo.dart';
import '../../repo/user_repo_reach.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {

  final CardRepo cardRepo;
  // final  UserRepo userRepo ;
  // List<CardImage>?cardList;
  GalleryBloc(this.cardRepo,) : super(GalleryLoading()) {
    on<FetchGalleryEvent>((event, emit) async {
     emit(GalleryLoading());
     try{
       LoginModel? user = LoginModel(jwtAccessToken: '', jwtRefreshToken: '', usersId:'');
       Users oneUser;
       const String usersId="cljy2cgdq000kydnuefc052ia";
       Response? response = await cardRepo.getCardBackgroundImage();

         print(response);

           if(response!.statusCode == 200){
             var s1=json.encode(response.data);
             CardImageModel cardImageModel= cardImageModelFromJson(s1);
           List<CardImage>  cardList=cardImageModel.cardImages;
             // var jsonData = response.data as List<dynamic>;
             // List<CardImage> cardList = jsonData
             //     .map((json) => CardImage.fromJson(json))
             //     .toList();
             emit(GalleryLoadedState(cardList!));
       }

     }catch(e){
       emit(GalleryErrorState(e.toString()));
     }
    });
  }
}
