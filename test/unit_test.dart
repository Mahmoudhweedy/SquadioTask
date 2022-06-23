import 'package:flutter_test/flutter_test.dart';
import 'package:squadio_task/Features/Characters/Data/DataSource/actors_remote_data_source.dart';
import 'package:squadio_task/Features/Characters/Data/Models/actor_details_model.dart';
import 'package:squadio_task/Features/Characters/Data/Models/actor_model.dart';

void main() {
  group('getAllActors', () {
    test('returns list of actor models when http response is successful',
        () async {
      expect(await ActorsRemoteDataSourceImpl().getAllActors(1),
          isA<List<ActorModel>>());
    });
    test('returns list of actor images models when http response is successful',
        () async {
      expect(await ActorsRemoteDataSourceImpl().getActorImages(1),
          isA<List<ActorImagesModel>>());
    });
  });
}
