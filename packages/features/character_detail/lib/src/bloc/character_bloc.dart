import 'package:catalog/catalog.dart';
import 'package:utility/utility.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc(
    this._getCharacter,
  ) : super(const CharacterState()) {
    on<CharacterFetchedEvent>(_onCharacterFetchedEvent);
  }

  final GetCharacter _getCharacter;

  Future<void> _onCharacterFetchedEvent(
    CharacterFetchedEvent event,
    Emitter<CharacterState> emit,
  ) async {
    return emit.forEach(
      _getCharacter(event.id),
      onData: (data) =>
          state.copyWith(status: ViewStatus.success, character: data),
      onError: (error, stackTrace) =>
          state.copyWith(status: ViewStatus.failure),
    );
  }
}
