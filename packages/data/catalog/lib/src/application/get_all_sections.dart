import 'package:catalog/src/domain/section/section.dart';
import 'package:catalog/src/domain/section/section_repository.dart';

class GetAllSection {
  GetAllSection(this._sectionRepository);

  final SectionRepository _sectionRepository;

  Stream<List<Section>> call() => _sectionRepository.findAll();
}
