import 'package:flutter/material.dart';

import '../../Domain/Entities/actor.dart';
import '../Screens/actor_screen.dart';
import 'app_fade_image.dart';

/// List item representing a single Character with its photo and name.
class CharacterListItem extends StatelessWidget {
  const CharacterListItem({
    required this.actor,
    Key? key,
  }) : super(key: key);

  final Actor actor;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ActorScreen(actor: actor))),
        leading: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: AppFadeImage(actorPhoto: actor.profilePath),
        ),
        title: Text(actor.name),
      );
}
