import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geodetect/screen/home/widgets/image_location_builder.dart';
import 'package:geodetect/screen/image_location/imagelocation_add_page.dart';
import 'package:geodetect/shared/ml/human_detector.dart';
import 'package:geodetect/shared/widget/button/custom_fab.dart';
import 'package:geodetect/shared/widget/image/image_add_dialog.dart';
import 'package:geodetect/shared/widget/layout/screen_layout.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;
  Future<void> onImageAdded(XFile image) async {
    setState(() {
      loading = true;
    });
    int personCount = await HumanDetector.detectHumanFromImage(image);
    var buildContext = context;
    if (buildContext.mounted) {
      setState(() {
        loading = false;
      });
      Navigator.of(buildContext).push(
        MaterialPageRoute(
          builder: (context) => ImageLocationAddPage(
            image: image,
            personCount: personCount,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      title: tr("homePage"),
      body: const ImageLocationBuilder(),
      actions: [
        if (loading)
          const Padding(
              padding: EdgeInsets.all(10.0),
              child: CircularProgressIndicator()),
      ],
      floatingActionButton: CustomFAB(
        onPressed: () {
          ImageAddDialog.show(
            context: context,
            onImageAdded: onImageAdded,
          );
        },
        iconData: Icons.add,
      ),
    );
  }
}
