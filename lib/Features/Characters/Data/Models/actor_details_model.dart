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
      aspectRatio: json['aspect_ratio'],
      height: json['height'],
      filePath: json['file_path'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      width: json['width'],
    );
  }
}
