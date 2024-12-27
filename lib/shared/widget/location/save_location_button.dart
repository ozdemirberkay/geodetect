import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geodetect/shared/bloc/image_location/image_location_bloc.dart';
import 'package:geodetect/shared/model/image_location.dart';
import 'package:geodetect/shared/widget/button/text_icon_button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class SaveLocationButton extends StatefulWidget {
  final int personCount;
  final XFile image;
  final TextEditingController textEditingController;
  const SaveLocationButton(
      {super.key,
      required this.personCount,
      required this.image,
      required this.textEditingController});

  @override
  State<SaveLocationButton> createState() => _SaveLocationButtonState();
}

class _SaveLocationButtonState extends State<SaveLocationButton> {
  void showAlert({required String text}) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text)),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconTextButton(
      iconData: Icons.save,
      label: tr("save"),
      onPressed: () async {
        bool serviceEnabled;
        LocationPermission permission;

        // Test if location services are enabled.
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          showAlert(text: tr("locationServicesAreDisabled"));
          return;
        }

        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied ||
              permission == LocationPermission.deniedForever) {
            showAlert(text: tr("locationPermissionsAreDenied"));
            return;
          }
        }

        var position = await Geolocator.getCurrentPosition();

        if (context.mounted) {
          BlocProvider.of<ImageLocationBloc>(context).add(
            AddImageLocation(
              imageLocation: ImageLocation(
                latitute: position.latitude,
                longitute: position.longitude,
                note: widget.textEditingController.text,
                personCount: widget.personCount,
                photo: widget.image,
              ),
            ),
          );
          Navigator.of(context).pop();
        }
      },
    );
  }
}
