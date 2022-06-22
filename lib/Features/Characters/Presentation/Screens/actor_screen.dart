import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Domain/Entities/actor.dart';
import '../Provider/actors_provider.dart';
import '../Widgets/app_fade_image.dart';
import 'image_full_size.dart';

class ActorScreen extends StatefulWidget {
  const ActorScreen({
    Key? key,
    required this.actor,
  }) : super(key: key);
  final Actor actor;
  @override
  State<ActorScreen> createState() => _ActorScreenState();
}

class _ActorScreenState extends State<ActorScreen> {
  @override
  void initState() {
    context.read<ActorsProvider>().getActorsImages(widget.actor.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.actor.name),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Hero(
              tag: widget.actor.id,
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: AppFadeImage(
                  actorPhoto: widget.actor.profilePath,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Consumer<ActorsProvider>(
        builder: (context, provider, child) => GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: .9,
          ),
          itemCount: provider.images.length,
          itemBuilder: (context, index) => InkWell(
              onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          FullSizeImage(image: provider.images[index]),
                    ),
                  ),
              child: Hero(
                  tag: provider.images[index].filePath,
                  child: AppFadeImage(
                      actorPhoto: provider.images[index].filePath))),
        ),
      ),
    );
  }
}
