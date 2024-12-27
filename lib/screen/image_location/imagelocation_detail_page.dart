import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geodetect/screen/image_location/layout/image_location_layout.dart';
import 'package:geodetect/shared/model/image_location.dart';
import 'package:geodetect/shared/widget/location/delete_location_button.dart';

class ImageLocationDetailPage extends StatelessWidget {
  final ImageLocation imageLocation;
  const ImageLocationDetailPage({super.key, required this.imageLocation});

  @override
  Widget build(BuildContext context) {
    return ImageLocationLayout(
      title: tr("details"),
      readOnlyNote: true,
      image: imageLocation.photo,
      personCount: imageLocation.personCount,
      noteController: TextEditingController(text: imageLocation.note),
      endButton: DeleteLocationButton(
        imageLocation: imageLocation,
      ),
    );
  }
}
