part of 'gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();
}
class FetchGalleryEvent extends GalleryEvent {
  @override
  List<Object?> get props => [];

}
