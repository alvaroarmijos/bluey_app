import 'dart:async';

import 'package:bluey_app/data/firebase_api/firebase_api_client.dart';
import 'package:bluey_app/features/home/model/section_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.firebaseApiClient) : super(const HomeState()) {
    on<SectionsFetchedEvent>(_onSectionsFetchedEvent);
  }

  final FirebaseApiClient firebaseApiClient;

  Future<void> _onSectionsFetchedEvent(
    SectionsFetchedEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final sections = await firebaseApiClient.fetchSections();
      emit(state.copyWith(status: HomeStatus.success, sections: sections));
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
