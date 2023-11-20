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
}

class ItemDescription {
  final String label;
  final String description;

  ItemDescription({required this.label, required this.description});
}
