import 'package:squadio_task/Features/Characters/Data/Models/actor_model.dart';

import '../Repositories/actors_repository.dart';

class GetAllActorsUsecase {
  final ActorsRepository repository;

  GetAllActorsUsecase(this.repository);

  Future<List<ActorModel>> call(int pageKey) async {
    return await repository.getAllActors(pageKey);
  }
}
