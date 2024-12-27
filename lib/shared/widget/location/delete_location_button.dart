import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geodetect/shared/bloc/image_location/image_location_bloc.dart';
import 'package:geodetect/shared/model/image_location.dart';
import 'package:geodetect/shared/widget/button/text_icon_button.dart';

class DeleteLocationButton extends StatelessWidget {
  final ImageLocation imageLocation;
  const DeleteLocationButton({super.key, required this.imageLocation});

  @override
  Widget build(BuildContext context) {
    return IconTextButton(
      iconData: Icons.delete,
      label: tr("delete"),
      onPressed: () async {
        BlocProvider.of<ImageLocationBloc>(context)
            .add(DeleteImageLocation(imageLocation: imageLocation));
        Navigator.of(context).pop();
      },
    );
  }
}
