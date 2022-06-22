import 'package:flutter/foundation.dart';
import 'package:squadio_task/Features/Characters/Domain/Entities/actor.dart';

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

  // getActorsImages(int actorId) async {
  //   emit(LoadingActorsState());
  //   final doneOrFail = await getActorsDetailsUsecase(actorId);
  //   emit(LoadedActorImagesState(images: doneOrFail));
  // }
}
