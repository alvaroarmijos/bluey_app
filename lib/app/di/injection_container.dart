import 'package:catalog/catalog.dart' as data_catalog;
import 'package:character_detail/character_detail.dart'
    as feature_character_detail;
import 'package:home/home.dart' as feature_home;
import 'package:utility/utility.dart' as core_utility;

final sl = core_utility.GetIt.instance;

Future<void> configureDependencies() async {
  await core_utility.configureDependencies(sl);
  await data_catalog.configureDependencies(sl);
  await feature_home.configureDependencies(sl);
  await feature_character_detail.configureDependencies(sl);
}
