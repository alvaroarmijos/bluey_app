import 'package:catalog/catalog.dart';
import 'package:catalog/src/domain/character/character_repository.dart';
import 'package:catalog/src/domain/section/section_repository.dart';
import 'package:catalog/src/infrastrucuture/character/character_mapper.dart';
import 'package:catalog/src/infrastrucuture/character/character_repository_impl.dart';
import 'package:catalog/src/infrastrucuture/section/section_mapper.dart';
import 'package:catalog/src/infrastrucuture/section/section_repository_impl.dart';
import 'package:utility/utility.dart';

import '../src/infrastrucuture/api_client.dart';

Future<void> configureDependencies(GetIt sl) async {
  //Use cases
  sl.registerLazySingleton(() => GetAllSections(sl()));
  sl.registerLazySingleton(() => GetCharacter(sl()));

  //Mappers
  sl.registerLazySingleton(() => const CharacterMapper());
  sl.registerLazySingleton(() => const SectionMapper());

  // Api Client
  sl.registerLazySingleton<FirebaseApiClient>(
    () => FirebaseApiClient(
      httpClient: sl(),
    ),
  );

  //Repository
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(
      sl(),
      sl(),
    ),
  );
  sl.registerLazySingleton<SectionRepository>(
    () => SectionRepositoryImpl(
      sl(),
      sl(),
    ),
  );
}
