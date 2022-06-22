import 'package:flutter/material.dart';

import '../../../../App/constants/const_string.dart';

class AppFadeImage extends StatelessWidget {
  const AppFadeImage({
    Key? key,
    required this.actorPhoto,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
  }) : super(key: key);

  final String actorPhoto;
  final BoxFit? fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      image: NetworkImage("$remoteImagePath$actorPhoto"),
      placeholder: const AssetImage("${localPath}man.jpg"),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset("${localPath}man.jpg");
      },
      fit: fit,
      height: height,
      width: width,
    );
  }
}
