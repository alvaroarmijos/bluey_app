part of 'home_bloc.dart';

enum HomeStatus { loading, success, failure }

final class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.loading,
    this.sections,
  });

  final HomeStatus status;
  final List<SectionModel>? sections;

  HomeState copyWith({
    HomeStatus? status,
    List<SectionModel>? sections,
  }) {
    return HomeState(
      status: status ?? this.status,
      sections: sections ?? this.sections,
    );
  }

  @override
  List<Object?> get props => [status, sections];
}
