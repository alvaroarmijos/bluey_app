part of 'character_bloc.dart';

sealed class CharacterEvent {
  const CharacterEvent();
}

final class CharacterFetchedEvent extends CharacterEvent {
  const CharacterFetchedEvent(this.id);

  final int id;
}
