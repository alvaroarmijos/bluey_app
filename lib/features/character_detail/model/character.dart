class Character {
  final String name;
  final String quote;
  final String img;
  final String description;
  final String descriptionImg;
  final List<ItemDescription> items;

  Character(
      {required this.name,
      required this.quote,
      required this.img,
      required this.description,
      required this.descriptionImg,
      required this.items});

  factory Character.fromJson(Map jsonObj) {
    final String name = jsonObj['name'] ?? "";
    final String quote = jsonObj['quote'] ?? "";
    final String img = jsonObj['img'] ?? "";
    final String description = jsonObj['description'] ?? "";
    final String descriptionImg = jsonObj['descriptionImg'] ?? "";
    final List<ItemDescription> items =
        ItemDescription.fromJsonArray(jsonObj['items']);

    return Character(
      name: name,
      quote: quote,
      img: img,
      description: description,
      descriptionImg: descriptionImg,
      items: items,
    );
  }
}

class ItemDescription {
  final String label;
  final String description;

  ItemDescription({required this.label, required this.description});

  factory ItemDescription.fromJson(Map jsonObj) {
    final String label = jsonObj['label'] ?? "";
    final String description = jsonObj['description'] ?? "";

    return ItemDescription(
      label: label,
      description: description,
    );
  }

  static List<ItemDescription> fromJsonArray(List jsonArray) =>
      jsonArray.map((e) => ItemDescription.fromJson(e)).toList();
}
