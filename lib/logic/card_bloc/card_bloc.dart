// import 'dart:async';
// import 'dart:html';
//
// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:equatable/equatable.dart';
// import 'package:image_picker/image_picker.dart';
//
//
// import '../../model/card_image_model.dart';
// import '../../repo/card_image_repo.dart';
// import '../../repo/gallery_repo.dart';
// import 'card_state.dart';
//
// part 'card_event.dart';
//
//
// class CardBloc extends Bloc<CardEvent, CardState> {
//   final GalleryRepo galleryRepo;
//   CardBloc(this.galleryRepo) : super(CardLoading()) {
//     on<PickImageEvent>(galleryImageTake as EventHandler<PickImageEvent, CardState>);
//   }
//
//   FutureOr<void> galleryImageTake () async{
//     const String usersId="clje5s7ua002eefnuhpucb5sm";
//     File? pickedImages =await pickImageFromGallery();
//     emit(PickedImageState(pickedImages,usersId));
//
//   }
//   Future<File?> pickImageFromGallery() async {
//     final picker =ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if(pickedFile !=null){
//       return File(pickedFile.path as List<Object>, "arun.jpg");
//     }
//     return null;
//   }
// }
//
//
//
//
//
//
//
//
//
//
// // class CardBloc extends Bloc<CardEvent, CardState> {
// //   final CardRepo cardRepo;
// //   CardBloc(this.cardRepo) : super(CardLoading()) {
// //     on<FetchCardEvent>((event, emit) async{
// //       emit(CardLoading());
// //       try{
// //         Response? response = await cardRepo.getCardBackgroundImage();
// //         emit(CardLoadedState(response as List<CardImage>));
// //       }catch(e){
// //         emit(CardError(e.toString()));
// //       }
// //     });
// //   }
// // }