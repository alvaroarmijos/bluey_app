import 'package:catalog/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui/ui.dart';

class SectionView extends StatelessWidget {
  const SectionView({super.key, required this.section});

  final Section section;

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
              section.title,
              style: BlueyStyles.title(color: BlueyColors.purple),
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: section.items.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => AppNavigator.navigateToCharacterDetail(
                  context, section.items[index].id),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: FadeInImage.assetNetwork(
                          placeholder: "assets/images/bluey_logo.png",
                          image: section.items[index].img,
                          width: 100,
                          height: 200,
                          placeholderFit: BoxFit.fitWidth,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  if (section.items[index].name != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        section.items[index].name!,
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
