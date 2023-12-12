part of 'character_bloc.dart';

final class CharacterState extends Equatable {
  const CharacterState({
    this.status = ViewStatus.loading,
    this.character,
  });

  final ViewStatus status;
  final Character? character;

  CharacterState copyWith({
    ViewStatus? status,
    Character? character,
  }) {
    return CharacterState(
      status: status ?? this.status,
      character: character ?? this.character,
    );
  }

  @override
  List<Object?> get props => [status, character];
}
