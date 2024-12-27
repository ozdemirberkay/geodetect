import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geodetect/shared/widget/input/custom_input_field.dart';
import 'package:geodetect/shared/widget/layout/screen_layout.dart';
import 'package:image_picker/image_picker.dart';

class ImageLocationLayout extends StatelessWidget {
  final String title;
  final bool readOnlyNote;
  final XFile image;
  final int personCount;
  final TextEditingController? noteController;
  final Widget endButton;
  const ImageLocationLayout(
      {super.key,
      required this.title,
      required this.readOnlyNote,
      required this.image,
      required this.personCount,
      this.noteController,
      required this.endButton});

  @override
  Widget build(BuildContext context) {
    final imageFile = File(image.path);
    return ScreenLayout(
      title: title,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: FutureBuilder<bool>(
                future: imageFile.exists(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.data == true) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.sizeOf(context).height / 2),
                      child: Image.file(
                        imageFile,
                        fit: BoxFit.scaleDown,
                      ),
                    );
                  } else {
                    return Text(tr("photoNotFound"));
                  }
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(tr("personCountInPhoto",
                namedArgs: {"personCount": personCount.toString()})),
            const SizedBox(height: 8),
            CustomInputField(
              readOnly: readOnlyNote,
              controller: noteController,
              label: tr("note"),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: endButton,
            ),
          ],
        ),
      ),
    );
  }
}
