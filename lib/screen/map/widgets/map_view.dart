import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geodetect/screen/image_location/imagelocation_detail_page.dart';
import 'package:geodetect/shared/bloc/image_location/image_location_bloc.dart';
import 'package:geodetect/shared/model/image_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageLocationBloc, ImageLocationState>(
      builder: (context, state) {
        List<ImageLocation> imageLocationList = state.imageLocationList;

        CameraPosition initialCameraPosition;
        if (imageLocationList.isNotEmpty) {
          initialCameraPosition = initialCameraPosition = CameraPosition(
            target: LatLng(imageLocationList.first.latitute,
                imageLocationList.first.longitute),
            zoom: 15,
          );
        } else {
          initialCameraPosition = const CameraPosition(
            target: LatLng(39.925018, 32.836956),
            zoom: 15,
          );
        }

        return GoogleMap(
          myLocationEnabled: true,
          mapType: MapType.terrain,
          markers: imageLocationList
              .map((e) => Marker(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ImageLocationDetailPage(imageLocation: e)));
                    },
                    markerId: MarkerId(imageLocationList.indexOf(e).toString()),
                    position: LatLng(e.latitute, e.longitute),
                    infoWindow: InfoWindow(
                      title: tr("personCount",
                          namedArgs: {"count": e.personCount.toString()}),
                      snippet: e.note,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ImageLocationDetailPage(imageLocation: e)));
                      },
                    ),
                  ))
              .toSet(),
          initialCameraPosition: initialCameraPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        );
      },
    );
  }
}
