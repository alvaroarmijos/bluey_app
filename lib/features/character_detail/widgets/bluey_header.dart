import 'package:bluey_app/common/colors.dart';
import 'package:bluey_app/common/styles.dart';
import 'package:flutter/material.dart';

class BlueyHeader extends StatelessWidget {
  const BlueyHeader({
    super.key,
    required this.img,
    required this.name,
    required this.quote,
  });

  final String img;
  final String name;
  final String quote;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 3,
          child: FadeInImage.assetNetwork(
            placeholder: "assets/images/bluey_logo.png",
            image: img,
            height: 200,
            width: 200,
          ),
        ),
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: BlueyStyles.title(),
                ),
                Text(
                  quote,
                  style: BlueyStyles.body(color: BlueyColors.purple),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
