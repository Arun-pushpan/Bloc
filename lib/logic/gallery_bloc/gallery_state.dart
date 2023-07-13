part of 'gallery_bloc.dart';

abstract class GalleryState extends Equatable {

}

class GalleryLoading extends GalleryState {
  @override
  List<Object> get props => [];
}

class GalleryLoadedState extends GalleryState {
   final List<CardImage> cardList;
   GalleryLoadedState(this.cardList);
  @override
  // TODO: implement props
  List<Object?> get props => [cardList];

}

class GalleryErrorState extends GalleryState {
  final String error;
  GalleryErrorState(this.error);
  @override
  List<Object?> get props => [error];
}