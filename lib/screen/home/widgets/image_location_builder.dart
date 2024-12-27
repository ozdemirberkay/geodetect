import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geodetect/screen/home/widgets/image_location_card.dart';
import 'package:geodetect/shared/bloc/image_location/image_location_bloc.dart';
import 'package:geodetect/shared/model/image_location.dart';
import 'package:lottie/lottie.dart';

class ImageLocationBuilder extends StatelessWidget {
  const ImageLocationBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageLocationBloc, ImageLocationState>(
      builder: (context, state) {
        List<ImageLocation> imageLocationList = state.imageLocationList;

        if (imageLocationList.isEmpty) {
          double getSmallest = min(MediaQuery.sizeOf(context).width,
              MediaQuery.sizeOf(context).height);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: getSmallest / 2,
                  child: Lottie.asset('assets/animations/empty.json'),
                ),
                Text(tr("noRecordFound")),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              ImageLocation imageLocation = imageLocationList[index];
              return ImageLocationCard(imageLocation: imageLocation);
            },
            itemCount: imageLocationList.length,
          ),
        );
      },
    );
  }
}
