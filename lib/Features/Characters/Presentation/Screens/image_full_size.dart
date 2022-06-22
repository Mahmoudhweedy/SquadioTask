import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

import '../../../../App/constants/const_string.dart';
import '../../Domain/Entities/actor_images.dart';
import '../Widgets/app_fade_image.dart';

class FullSizeImage extends StatelessWidget {
  const FullSizeImage({Key? key, required this.image}) : super(key: key);
  final ActorImages image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await GallerySaver.saveImage(
          "$remoteImagePath${image.filePath}",
          albumName: "Ibtikar Actors",
        ),
        child: const Icon(Icons.download),
      ),
      body: AppFadeImage(
        actorPhoto: image.filePath,
        height: image.height.toDouble(),
        width: image.width.toDouble(),
        fit: BoxFit.fill,
      ),
    );
  }
}
