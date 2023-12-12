import 'package:character_detail/src/bloc/character_bloc.dart';
import 'package:utility/utility.dart';

Future<void> configureDependencies(GetIt sl) async {
  //Bloc
  sl.registerFactory(() => CharacterBloc(sl()));
}
