part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

final class SectionsFetchedEvent extends HomeEvent {
  const SectionsFetchedEvent();
}
