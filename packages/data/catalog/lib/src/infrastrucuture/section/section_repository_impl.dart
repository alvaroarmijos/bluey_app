import 'package:catalog/src/domain/section/section.dart';
import 'package:catalog/src/domain/section/section_repository.dart';
import 'package:catalog/src/infrastrucuture/api_client.dart';
import 'package:catalog/src/infrastrucuture/section/section_mapper.dart';

class SectionRepositoryImpl implements SectionRepository {
  SectionRepositoryImpl(
    this._firebaseApiClient,
    this._sectionMapper,
  );

  final FirebaseApiClient _firebaseApiClient;
  final SectionMapper _sectionMapper;

  @override
  Stream<List<Section>> findAll() => _firebaseApiClient
      .fetchSections()
      .asStream()
      .map((dtos) => _sectionMapper.fromApiDtoList(dtos));
}
