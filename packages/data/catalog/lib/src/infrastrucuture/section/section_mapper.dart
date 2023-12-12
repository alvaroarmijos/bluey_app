import 'package:catalog/src/domain/section/section.dart';
import 'package:catalog/src/infrastrucuture/api_dtos.dart';

class SectionMapper {
  const SectionMapper();

  Section fromApiDto(SectionDto apiDto) {
    final title = apiDto.title;
    final items = fromApiSectionItemDtoList(apiDto.items);

    return Section(
      title: title,
      items: items,
    );
  }

  List<SectionItem> fromApiSectionItemDtoList(List<SectionItemDto> dtos) =>
      dtos.map((dto) => itemFromApiDto(dto)).toList();

  SectionItem itemFromApiDto(SectionItemDto apiDto) {
    final img = apiDto.img;
    final id = apiDto.id;

    return SectionItem(
      img: img,
      id: id,
    );
  }

  List<Section> fromApiDtoList(List<SectionDto> dtos) =>
      dtos.map((dto) => fromApiDto(dto)).toList();
}
