import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geodetect/screen/image_location/layout/image_location_layout.dart';
import 'package:geodetect/shared/widget/location/save_location_button.dart';
import 'package:image_picker/image_picker.dart';

class ImageLocationAddPage extends StatefulWidget {
  final XFile image;
  final int personCount;
  const ImageLocationAddPage(
      {super.key, required this.image, required this.personCount});

  @override
  State<ImageLocationAddPage> createState() => _ImageLocationAddPageState();
}

class _ImageLocationAddPageState extends State<ImageLocationAddPage> {
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ImageLocationLayout(
      title: tr("save"),
      readOnlyNote: false,
      image: widget.image,
      personCount: widget.personCount,
      noteController: _noteController,
      endButton: SaveLocationButton(
        image: widget.image,
        personCount: widget.personCount,
        textEditingController: _noteController,
      ),
    );
  }
}
