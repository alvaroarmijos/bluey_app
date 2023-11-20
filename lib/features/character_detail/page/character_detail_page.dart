import 'package:bluey_app/common/colors.dart';
import 'package:bluey_app/features/character_detail/model/character.dart';
import 'package:bluey_app/features/character_detail/widgets/bluey_description.dart';
import 'package:bluey_app/features/character_detail/widgets/bluey_header.dart';
import 'package:flutter/material.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlueyColors.blue,
      body: ListView(
        children: [
          const CustomAppBar(),
          BlueyHeader(
            name: character.name,
            quote: character.quote,
            img: character.img,
          ),
          BlueyDescription(
            name: character.name,
            description: character.description,
            descriptionImg: character.descriptionImg,
            items: character.items,
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.navigate_before_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}

final character = Character(
  name: "Bluey",
  quote: "\"I don’t want a valuable lime lesson! I just want an ice cream!\"",
  img: "https://www.bluey.tv/wp-content/uploads/2023/07/Bluey.png",
  description:
      "is an inexhaustible blue heeler puppy, who lives with her mum, dad and little sister Bingo. She likes to laugh and have fun but more than anything else she loves to play games with her family.",
  descriptionImg:
      "https://www.bluey.tv/wp-content/uploads/2019/04/char-bluey@2x.png",
  items: [
    ItemDescription(label: "Full Name", description: "Bluey Christine Heeler"),
    ItemDescription(label: "Age", description: "6 (S1-3) 7 (S3)"),
    ItemDescription(label: "Breed", description: "Blue Heeler"),
    ItemDescription(
        label: "Also known as",
        description:
            "Janet (Grannies)\nBarnicus (Bumpy and the Wise Old Wolfhound)\nRhonda (Hammerbarn)\nKaren (Swim School)\nMargaret (Swim School)")
  ],
);
