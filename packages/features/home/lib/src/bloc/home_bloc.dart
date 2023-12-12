import 'dart:async';

import 'package:catalog/catalog.dart';
import 'package:utility/utility.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getAllSections,
  ) : super(const HomeState()) {
    on<SectionsFetchedEvent>(_onSectionsFetchedEvent);
  }

  final GetAllSections _getAllSections;

  Future<void> _onSectionsFetchedEvent(
    SectionsFetchedEvent event,
    Emitter<HomeState> emit,
  ) async {
    return emit.forEach(
      _getAllSections(),
      onData: (data) =>
          state.copyWith(status: ViewStatus.success, sections: data),
      onError: (_, __) => state.copyWith(status: ViewStatus.failure),
    );
  }
}
