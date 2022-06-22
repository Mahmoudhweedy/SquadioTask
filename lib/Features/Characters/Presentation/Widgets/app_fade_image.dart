import 'package:flutter/material.dart';

import '../../../../App/constants/const_string.dart';

class AppFadeImage extends StatelessWidget {
  const AppFadeImage({
    Key? key,
    required this.actorPhoto,
  }) : super(key: key);

  final String actorPhoto;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      image: NetworkImage("$remoteImagePath$actorPhoto"),
      placeholder: const AssetImage("${localPath}man.jpg"),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset("${localPath}man.jpg");
      },
      fit: BoxFit.contain,
    );
  }
}
