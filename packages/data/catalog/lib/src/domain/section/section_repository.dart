import 'package:catalog/src/domain/section/section.dart';

abstract class SectionRepository {
  Stream<List<Section>> findAll();
}
