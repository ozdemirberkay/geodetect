import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geodetect/shared/widget/button/text_icon_button.dart';
import 'package:image_picker/image_picker.dart';

class ImageAddDialog extends StatelessWidget {
  final Function(XFile) onImageAdded;
  const ImageAddDialog({super.key, required this.onImageAdded});

  static void show({
    required BuildContext context,
    required Function(XFile) onImageAdded,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return ImageAddDialog(
            onImageAdded: onImageAdded,
          );
        });
  }

  Future<void> _pickImage(ImageSource imageSource, BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      if (context.mounted) {
        Navigator.of(context).pop();
      }
      onImageAdded(pickedFile);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        tr("addPhoto"),
        textAlign: TextAlign.center,
      ),
      content: Text(tr("selectPhotoAddingSource")),
      actions: [
        IconTextButton(
          onPressed: () async {
            await _pickImage(ImageSource.camera, context);
          },
          label: tr("camera"),
          iconData: Icons.photo_camera,
        ),
        IconTextButton(
          iconData: Icons.image,
          onPressed: () async {
            await _pickImage(ImageSource.gallery, context);
          },
          label: tr("gallery"),
        ),
      ],
    );
  }
}
