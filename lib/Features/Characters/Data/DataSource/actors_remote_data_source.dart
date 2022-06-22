import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:squadio_task/App/constants/const_string.dart';
import 'package:squadio_task/Features/Characters/Data/Models/actor_details_model.dart';
import 'package:squadio_task/Features/Characters/Data/Models/actor_model.dart';

import '../../../../App/Errors/exceptions.dart';

abstract class ActorRemoteDataSource {
  Future<List<ActorModel>> getAllActors(int pageKey);
  Future<List<ActorImagesModel>> getActorImages(int actorId);
}

const baseUrl = "https://api.themoviedb.org/3";

class ActorsRemoteDataSourceImpl implements ActorRemoteDataSource {
  @override
  Future<List<ActorModel>> getAllActors(int pageKey) async {
    final response = await http.get(
      Uri.parse(
          "$baseUrl/person/popular?api_key=$apiKey&language=en-US&page=$pageKey"),
      headers: {"Content-Type": "application/json"},
    );
    print(
        "$baseUrl/person/popular?api_key=$apiKey&language=en-US&page=$pageKey");
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      final List<ActorModel> actorModels = decodedJson['results']
          .map<ActorModel>(
              (jsonActorModel) => ActorModel.fromJson(jsonActorModel))
          .toList();
      return actorModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ActorImagesModel>> getActorImages(int actorId) async {
    final response = await http.get(
      Uri.parse("$baseUrl/posts/$actorId"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body) as List;
      final List<ActorImagesModel> actor =
          decodedJson.map((e) => ActorImagesModel.fromJson(e)).toList();
      return actor;
    } else {
      throw ServerException();
    }
  }
}
