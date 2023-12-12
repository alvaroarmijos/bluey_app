import 'package:catalog/src/domain/character/character.dart';

abstract class CharacterRepository {
  Stream<Character> findById(int id);
}
