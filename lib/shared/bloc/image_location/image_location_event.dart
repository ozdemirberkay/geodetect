part of 'image_location_bloc.dart';

class ImageLocationEvent {}

class DeleteImageLocation extends ImageLocationEvent {
  final ImageLocation imageLocation;
  DeleteImageLocation({required this.imageLocation});
}

class AddImageLocation extends ImageLocationEvent {
  final ImageLocation imageLocation;
  AddImageLocation({required this.imageLocation});
}
