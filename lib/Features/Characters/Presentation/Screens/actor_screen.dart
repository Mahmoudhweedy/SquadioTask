import 'package:flutter/material.dart';

import '../../Domain/Entities/actor.dart';
import '../Widgets/app_fade_image.dart';

class ActorScreen extends StatelessWidget {
  const ActorScreen({
    Key? key,
    required this.actor,
  }) : super(key: key);
  final Actor actor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppFadeImage(actorPhoto: actor.profilePath),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) => Container())
          ],
        ),
      ),
    );
  }
}
