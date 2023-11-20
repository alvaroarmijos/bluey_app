class SectionItemModel {
  final String? name;
  final String img;
  final int id;

  SectionItemModel({this.name, required this.img, required this.id});

  factory SectionItemModel.fromJson(Map jsonObj) {
    final String name = jsonObj['name'] ?? "";
    final String img = jsonObj['img'];
    final int id = jsonObj['id'] ?? 0;

    return SectionItemModel(
      name: name,
      img: img,
      id: id,
    );
  }

  static List<SectionItemModel> fromJsonArray(List jsonArray) =>
      jsonArray.map((e) => SectionItemModel.fromJson(e)).toList();
}
