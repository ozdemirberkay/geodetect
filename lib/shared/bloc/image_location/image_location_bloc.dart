import 'package:geodetect/shared/model/image_location.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'image_location_event.dart';
part 'image_location_state.dart';

class ImageLocationBloc
    extends HydratedBloc<ImageLocationEvent, ImageLocationState> {
  ImageLocationBloc() : super(ImageLocationInitial(imageLocationList: [])) {
    on<AddImageLocation>(onAddImageLocation);
    on<DeleteImageLocation>(onDeleteImageLocation);
  }

  void onAddImageLocation(
      AddImageLocation event, Emitter<ImageLocationState> emit) {
    List<ImageLocation> newImageLocationList =
        List.from(state.imageLocationList);
    newImageLocationList.add(event.imageLocation);
    emit(
      ImageLocationChanged(imageLocationList: newImageLocationList),
    );
  }

  void onDeleteImageLocation(
      DeleteImageLocation event, Emitter<ImageLocationState> emit) {
    List<ImageLocation> newImageLocationList =
        List.from(state.imageLocationList);
    newImageLocationList.remove(event.imageLocation);
    emit(
      ImageLocationChanged(imageLocationList: newImageLocationList),
    );
  }

  @override
  ImageLocationState? fromJson(Map<String, dynamic> json) {
    final List<dynamic>? imageLocationsJson = json['imageLocations'];
    return ImageLocationChanged(
        imageLocationList: imageLocationsJson
                ?.map((imageLocation) => ImageLocation.fromJson(imageLocation))
                .toList() ??
            []);
  }

  @override
  Map<String, dynamic>? toJson(ImageLocationState state) {
    return {
      "imageLocations": state.imageLocationList
          .map((imageLocation) => imageLocation.toJson())
          .toList()
    };
  }
}
