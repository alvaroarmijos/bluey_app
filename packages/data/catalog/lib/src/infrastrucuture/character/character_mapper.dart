import 'package:catalog/src/domain/character/character.dart';
import 'package:catalog/src/infrastrucuture/api_dtos.dart';

class CharacterMapper {
  const CharacterMapper();

  Character fromApiDto(CharacterDto apiDto) {
    final name = apiDto.name;
    final quote = apiDto.quote;
    final img = apiDto.img;
    final description = apiDto.description;
    final descriptionImg = apiDto.descriptionImg;
    final items = fromApiItemDescriptionDtoList(apiDto.items);

    return Character(
      name: name,
      quote: quote,
      img: img,
      description: description,
      descriptionImg: descriptionImg,
      items: items,
    );
  }

  List<ItemDescription> fromApiItemDescriptionDtoList(
          List<ItemDescriptionDto> dtos) =>
      dtos.map((dto) => itemFromApiDto(dto)).toList();

  ItemDescription itemFromApiDto(ItemDescriptionDto apiDto) {
    final label = apiDto.label;
    final description = apiDto.description;

    return ItemDescription(
      label: label,
      description: description,
    );
  }
}
