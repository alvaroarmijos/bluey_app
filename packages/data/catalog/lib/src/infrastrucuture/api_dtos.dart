class CharacterDto {
  final String name;
  final String quote;
  final String img;
  final String description;
  final String descriptionImg;
  final List<ItemDescriptionDto> items;

  CharacterDto({
    required this.name,
    required this.quote,
    required this.img,
    required this.description,
    required this.descriptionImg,
    required this.items,
  });

  factory CharacterDto.fromJson(Map jsonObj) {
    final String name = jsonObj['name'] ?? "";
    final String quote = jsonObj['quote'] ?? "";
    final String img = jsonObj['img'] ?? "";
    final String description = jsonObj['description'] ?? "";
    final String descriptionImg = jsonObj['descriptionImg'] ?? "";
    final List<ItemDescriptionDto> items =
        ItemDescriptionDto.fromJsonArray(jsonObj['items']);

    return CharacterDto(
      name: name,
      quote: quote,
      img: img,
      description: description,
      descriptionImg: descriptionImg,
      items: items,
    );
  }
}

class ItemDescriptionDto {
  final String label;
  final String description;

  ItemDescriptionDto({required this.label, required this.description});

  factory ItemDescriptionDto.fromJson(Map jsonObj) {
    final String label = jsonObj['label'] ?? "";
    final String description = jsonObj['description'] ?? "";

    return ItemDescriptionDto(
      label: label,
      description: description,
    );
  }

  static List<ItemDescriptionDto> fromJsonArray(List jsonArray) =>
      jsonArray.map((e) => ItemDescriptionDto.fromJson(e)).toList();
}

class SectionDto {
  final String title;
  final List<SectionItemDto> items;

  SectionDto({
    required this.title,
    required this.items,
  });

  factory SectionDto.fromJson(Map jsonObj) {
    final String title = jsonObj['title'] ?? "";
    final List<SectionItemDto> items =
        SectionItemDto.fromJsonArray(jsonObj['items']);

    return SectionDto(
      title: title,
      items: items,
    );
  }

  static List<SectionDto> fromJsonArray(List jsonArray) =>
      jsonArray.map((e) => SectionDto.fromJson(e)).toList();
}

class SectionItemDto {
  final String? name;
  final String img;
  final int id;

  SectionItemDto({this.name, required this.img, required this.id});

  factory SectionItemDto.fromJson(Map jsonObj) {
    final String name = jsonObj['name'] ?? "";
    final String img = jsonObj['img'];
    final int id = jsonObj['id'] ?? 0;

    return SectionItemDto(
      name: name,
      img: img,
      id: id,
    );
  }

  static List<SectionItemDto> fromJsonArray(List jsonArray) =>
      jsonArray.map((e) => SectionItemDto.fromJson(e)).toList();
}
