import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadio_task/Features/Characters/Data/Repositories/actors_repository_impl.dart';
import 'package:squadio_task/Features/Characters/Domain/Repositories/actors_repository.dart';
import 'package:squadio_task/Features/Characters/Domain/Usecases/get_actors_details.dart';
import 'package:squadio_task/Features/Characters/Domain/Usecases/get_all_actors.dart';
import 'package:squadio_task/Features/Characters/Presentation/Provider/actors_provider.dart';

import '../../Features/Characters/Data/DataSource/actors_local_data_source.dart';
import '../../Features/Characters/Data/DataSource/actors_remote_data_source.dart';
import '../Network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - actors

// Bloc

  sl.registerFactory(() => ActorsProvider(
        getAllActorsUsecase: sl(),
        getActorsDetailsUsecase: sl(),
      ));

// Usecases

  sl.registerLazySingleton(() => GetAllActorsUsecase(sl()));
  sl.registerLazySingleton(() => GetActorsDetailsUsecase(sl()));

// Repository

  sl.registerLazySingleton<ActorsRepository>(() => ActorsRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

// Datasources

  sl.registerLazySingleton<ActorRemoteDataSource>(
      () => ActorsRemoteDataSourceImpl());
  sl.registerLazySingleton<ActorsLocalDataSource>(
      () => ActorsLocalDataSourceImpl(sharedPreferences: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
