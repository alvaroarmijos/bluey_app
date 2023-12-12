part of 'home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.status = ViewStatus.loading,
    this.sections,
  });

  final ViewStatus status;
  final List<Section>? sections;

  HomeState copyWith({
    ViewStatus? status,
    List<Section>? sections,
  }) {
    return HomeState(
      status: status ?? this.status,
      sections: sections ?? this.sections,
    );
  }

  @override
  List<Object?> get props => [status, sections];
}
