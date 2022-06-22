import 'package:squadio_task/Features/Characters/Domain/Entities/actor.dart';

class ActorModel extends Actor {
  ActorModel({
    required super.adult,
    required super.gender,
    required super.id,
    required super.knownForDepartment,
    required super.name,
    required super.popularity,
    required super.profilePath,
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    return data;
  }
}
