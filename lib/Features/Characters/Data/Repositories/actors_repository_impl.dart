import 'package:squadio_task/Features/Characters/Data/DataSource/actors_local_data_source.dart';
import 'package:squadio_task/Features/Characters/Data/DataSource/actors_remote_data_source.dart';
import 'package:squadio_task/Features/Characters/Data/Models/actor_details_model.dart';
import 'package:squadio_task/Features/Characters/Data/Models/actor_model.dart';
import 'package:squadio_task/Features/Characters/Domain/Repositories/actors_repository.dart';

import '../../../../App/Network/network_info.dart';

class ActorsRepositoryImpl implements ActorsRepository {
  final ActorRemoteDataSource remoteDataSource;
  final ActorsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ActorsRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<List<ActorModel>> getAllActors(int pageKey) async {
    if (await networkInfo.isConnected) {
      final remoteActors = await remoteDataSource.getAllActors(pageKey);
      localDataSource.cacheActors(remoteActors);
      return remoteActors;
    } else {
      final localActors = await localDataSource.getCachedActors();
      return localActors;
    }
  }

  @override
  Future<List<ActorImagesModel>> getActorImages(int id) async {
    final actorImages = await remoteDataSource.getActorImages(id);
    return actorImages;
  }
}
