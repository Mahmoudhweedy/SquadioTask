import 'package:squadio_task/Features/Characters/Data/Models/actor_model.dart';

import '../../Data/Models/actor_details_model.dart';

abstract class ActorsRepository {
  Future<List<ActorModel>> getAllActors(int pageKey);
  Future<List<ActorImagesModel>> getActorImages(int id);
}
