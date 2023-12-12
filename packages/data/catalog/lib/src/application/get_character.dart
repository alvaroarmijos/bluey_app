import 'package:catalog/src/domain/character/character.dart';
import 'package:catalog/src/domain/character/character_repository.dart';

class GetCharacter {
  GetCharacter(this._characterRepository);

  final CharacterRepository _characterRepository;

  Stream<Character> call(int id) => _characterRepository.findById(id);
}
