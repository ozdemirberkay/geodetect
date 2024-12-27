part of 'image_location_bloc.dart';

class ImageLocationState {
  final List<ImageLocation> imageLocationList;
  ImageLocationState({this.imageLocationList = const []});
}

final class ImageLocationInitial extends ImageLocationState {
  ImageLocationInitial({required super.imageLocationList});
}

final class ImageLocationChanged extends ImageLocationState {
  ImageLocationChanged({required super.imageLocationList});
}
