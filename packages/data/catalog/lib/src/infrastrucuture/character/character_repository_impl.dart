import 'package:catalog/src/domain/character/character.dart';
import 'package:catalog/src/domain/character/character_repository.dart';
import 'package:catalog/src/infrastrucuture/api_client.dart';

import 'character_mapper.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  CharacterRepositoryImpl(
    this._firebaseApiClient,
    this._characterMapper,
  );

  final FirebaseApiClient _firebaseApiClient;
  final CharacterMapper _characterMapper;

  @override
  Stream<Character> findById(int id) => _firebaseApiClient
      .fetchCharacter(id)
      .asStream()
      .map((dto) => _characterMapper.fromApiDto(dto));
}
