import 'package:bluey_app/features/home/model/section_item_model.dart';

class SectionModel {
  final String title;
  final List<SectionItemModel> items;

  SectionModel(this.items, {required this.title});
}
