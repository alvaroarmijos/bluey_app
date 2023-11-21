import 'package:bluey_app/common/view_state.dart';
import 'package:bluey_app/features/character_detail/model/character.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/firebase_api/firebase_api_client.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc(this.firebaseApiClient) : super(const CharacterState()) {
    on<CharacterFetchedEvent>(_onCharacterFetchedEvent);
  }

  final FirebaseApiClient firebaseApiClient;

  Future<void> _onCharacterFetchedEvent(
    CharacterFetchedEvent event,
    Emitter<CharacterState> emit,
  ) async {
    emit(state.copyWith(status: ViewStatus.loading));
    try {
      final character = await firebaseApiClient.fetchCharacter(event.id);
      emit(state.copyWith(status: ViewStatus.success, character: character));
    } catch (_) {
      emit(state.copyWith(status: ViewStatus.failure));
    }
  }
}
