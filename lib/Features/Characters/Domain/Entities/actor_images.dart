import 'package:equatable/equatable.dart';

class ActorImages extends Equatable {
  final double aspectRatio;
  final int height;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;
  const ActorImages({
    required this.aspectRatio,
    required this.height,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  @override
  List<Object?> get props => [
        aspectRatio,
        height,
        filePath,
        voteAverage,
        voteCount,
        width,
      ];
}
