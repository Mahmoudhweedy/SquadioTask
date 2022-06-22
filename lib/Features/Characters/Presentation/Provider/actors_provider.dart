import 'package:flutter/foundation.dart';
import 'package:squadio_task/Features/Characters/Domain/Entities/actor.dart';
import 'package:squadio_task/Features/Characters/Domain/Entities/actor_images.dart';

import '../../Domain/Usecases/get_actors_details.dart';
import '../../Domain/Usecases/get_all_actors.dart';

class ActorsProvider extends ChangeNotifier {
  final GetAllActorsUsecase getAllActorsUsecase;
  final GetActorsDetailsUsecase getActorsDetailsUsecase;

  ActorsProvider({
    required this.getAllActorsUsecase,
    required this.getActorsDetailsUsecase,
  });

  Future<List<Actor>> getAllActors(int pageKey) async {
    final actors = await getAllActorsUsecase(pageKey);
    return actors;
  }

  List<ActorImages> images = [];
  Future<List<ActorImages>> getActorsImages(int actorId) async {
    images.clear();
    images = await getActorsDetailsUsecase(actorId);
    notifyListeners();
    return images;
  }
}
