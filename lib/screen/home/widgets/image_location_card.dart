import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geodetect/screen/image_location/imagelocation_detail_page.dart';
import 'package:geodetect/shared/model/image_location.dart';

class ImageLocationCard extends StatelessWidget {
  const ImageLocationCard({
    super.key,
    required this.imageLocation,
  });

  final ImageLocation imageLocation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) =>
                  ImageLocationDetailPage(imageLocation: imageLocation)),
        );
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: FileImage(
              File(imageLocation.photo.path),
            ),
          ),
          title: Text(
            tr("personCount",
                namedArgs: {"count": imageLocation.personCount.toString()}),
          ),
          subtitle: Text(imageLocation.note),
        ),
      ),
    );
  }
}
