import 'package:bluey_app/features/home/model/section_item_model.dart';

class SectionModel {
  final String title;
  final List<SectionItemModel> items;

  SectionModel({
    required this.title,
    required this.items,
  });

  factory SectionModel.fromJson(Map jsonObj) {
    final String title = jsonObj['title'] ?? "";
    final List<SectionItemModel> items =
        SectionItemModel.fromJsonArray(jsonObj['items']);

    return SectionModel(
      title: title,
      items: items,
    );
  }

  static List<SectionModel> fromJsonArray(List jsonArray) =>
      jsonArray.map((e) => SectionModel.fromJson(e)).toList();
}
