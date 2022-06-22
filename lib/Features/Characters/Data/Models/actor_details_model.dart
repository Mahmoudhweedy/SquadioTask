import '../../Domain/Entities/actor_images.dart';

class ActorImagesModel extends ActorImages {
  const ActorImagesModel({
    required super.aspectRatio,
    required super.height,
    required super.filePath,
    required super.voteAverage,
    required super.voteCount,
    required super.width,
  });

  factory ActorImagesModel.fromJson(Map<String, dynamic> json) {
    return ActorImagesModel(
      aspectRatio: json['aspectRatio'],
      height: json['height'],
      filePath: json['filePath'],
      voteAverage: json['voteAverage'],
      voteCount: json['voteCount'],
      width: json['width'],
    );
  }
}
