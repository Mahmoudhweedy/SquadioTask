import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadio_task/Features/Characters/Data/Models/actor_model.dart';

import '../../../../App/Errors/exceptions.dart';

abstract class ActorsLocalDataSource {
  Future<List<ActorModel>> getCachedActors();
  Future<void> cacheActors(List<ActorModel> actorsModel);
}

const cachedActors = "cachedActors";

class ActorsLocalDataSourceImpl implements ActorsLocalDataSource {
  final SharedPreferences sharedPreferences;

  ActorsLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheActors(List<ActorModel> actors) {
    List actoesModelToJson = actors
        .map<Map<String, dynamic>>((actorsModel) => actorsModel.toJson())
        .toList();
    sharedPreferences.setString(cachedActors, json.encode(actoesModelToJson));
    return Future.value();
  }

  @override
  Future<List<ActorModel>> getCachedActors() {
    final jsonString = sharedPreferences.getString(cachedActors);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<ActorModel> jsonToActorsModels = decodeJsonData
          .map<ActorModel>(
              (jsonActorModel) => ActorModel.fromJson(jsonActorModel))
          .toList();
      return Future.value(jsonToActorsModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
