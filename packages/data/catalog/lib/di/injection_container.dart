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
  sl.registerFactory(() => GetAllSections(sl()));
  sl.registerFactory(() => GetCharacter(sl()));

  //Mappers
  sl.registerFactory(() => const CharacterMapper());
  sl.registerFactory(() => const SectionMapper());

  // Api Client
  sl.registerLazySingleton<FirebaseApiClient>(
    () => FirebaseApiClient(
      httpClient: sl(),
    ),
  );

  //Repository
  sl.registerFactory<CharacterRepository>(
    () => CharacterRepositoryImpl(
      sl(),
      sl(),
    ),
  );
  sl.registerFactory<SectionRepository>(
    () => SectionRepositoryImpl(
      sl(),
      sl(),
    ),
  );
}
