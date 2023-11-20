import 'package:bluey_app/common/colors.dart';
import 'package:bluey_app/common/styles.dart';
import 'package:bluey_app/features/character_detail/model/character.dart';
import 'package:flutter/material.dart';

class BlueyDescription extends StatelessWidget {
  const BlueyDescription({
    super.key,
    required this.name,
    required this.description,
    required this.descriptionImg,
    required this.items,
  });

  final String name;
  final String description;
  final String descriptionImg;
  final List<ItemDescription> items;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: "$name ",
              style: BlueyStyles.body(color: BlueyColors.purple),
              children: [
                TextSpan(
                  text: description,
                  style: textTheme.bodyMedium
                      ?.copyWith(color: BlueyColors.purple, fontSize: 16),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 12),
                  color: BlueyColors.grey,
                  borderRadius: BorderRadius.circular(32)),
              child: Column(
                children: [
                  Text(
                    "Quick Facts",
                    style: BlueyStyles.title(color: BlueyColors.purple),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0; i < items.length; i++)
                              DescriptionItem(
                                label: items[i].label,
                                description: items[i].description,
                              )
                          ],
                        ),
                      ),
                      Flexible(
                        child: FadeInImage.assetNetwork(
                          placeholder: "assets/images/bluey_logo.png",
                          image: descriptionImg,
                          width: 100,
                          height: 150,
                        ),
                      )
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class DescriptionItem extends StatelessWidget {
  const DescriptionItem({
    super.key,
    required this.label,
    required this.description,
  });

  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: BlueyStyles.body(color: BlueyColors.purple),
        ),
        Text(
          description,
          style: const TextStyle(color: BlueyColors.purple),
        ),
        const SizedBox(
          height: 4,
        )
      ],
    );
  }
}
