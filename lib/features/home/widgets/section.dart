import 'package:bluey_app/features/character_detail/page/character_detail_page.dart';
import 'package:bluey_app/features/home/model/section_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../common/colors.dart';
import '../../../common/styles.dart';

class Section extends StatelessWidget {
  const Section({super.key, required this.sectionModel});

  final SectionModel sectionModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              sectionModel.title,
              style: BlueyStyles.title(color: BlueyColors.purple),
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sectionModel.items.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => CharacterDetailPage(
                    id: sectionModel.items[index].id,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(sectionModel.items[index].img)),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  if (sectionModel.items[index].name != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        sectionModel.items[index].name!,
                        style: BlueyStyles.body(),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16)
      ],
    );
  }
}
