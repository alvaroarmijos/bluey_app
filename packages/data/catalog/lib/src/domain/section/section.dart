class Section {
  final String title;
  final List<SectionItem> items;

  Section({
    required this.title,
    required this.items,
  });
}

class SectionItem {
  final String? name;
  final String img;
  final int id;

  SectionItem({this.name, required this.img, required this.id});
}
