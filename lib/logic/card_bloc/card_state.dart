

import 'dart:html';

import 'package:equatable/equatable.dart';

import '../../model/card_image_model.dart';

abstract class CardState extends Equatable {
  const CardState();
}

class CardLoading extends CardState {
  @override
  List<Object> get props => [];
}
class CardLoadedState extends CardState {
   final List<CardImage> cardImageList;
  const CardLoadedState(this.cardImageList);
  @override
  List<Object?> get props => [cardImageList];

}
class CardError extends CardState {
  final String error;
const CardError(this.error);
  @override

  List<Object?> get props => [error];

}

class PickedImageState extends CardState {

  final File? pickedImage;
  final String? userId;
  const PickedImageState(this.pickedImage,this.userId);
  @override

  List<Object?> get props => [pickedImage];

}


