import 'package:squadio_task/Features/Characters/Data/Models/actor_details_model.dart';

import '../Repositories/actors_repository.dart';

class GetActorsDetailsUsecase {
  final ActorsRepository repository;

  GetActorsDetailsUsecase(this.repository);

  Future<List<ActorImagesModel>> call(int actorId) async {
    return await repository.getActorImages(actorId);
  }
}
