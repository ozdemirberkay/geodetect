import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geodetect/screen/map/widgets/map_view.dart';
import 'package:geodetect/shared/widget/layout/screen_layout.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      title: tr("map"),
      body: const MapView(),
    );
  }
}
