import 'package:bluey_app/common/colors.dart';
import 'package:bluey_app/common/drawables.dart';
import 'package:bluey_app/common/styles.dart';
import 'package:bluey_app/features/home/model/section_item_model.dart';
import 'package:bluey_app/features/home/model/section_model.dart';
import 'package:bluey_app/features/home/page/home_loading_page.dart';
import 'package:bluey_app/features/home/widgets/section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: Future.delayed(const Duration(seconds: 2), () => true),
      initialData: false,
      builder: (context, snapshot) {
        final data = snapshot.data;

        if (data ?? false) {
          return Scaffold(
            backgroundColor: BlueyColors.blue,
            body: SafeArea(
              child: Center(
                child: ListView(
                  children: [
                    Image.asset(
                      BlueyDrawables.getLogo(),
                      color: Colors.white,
                      height: 48,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "Meet the characters",
                          style: BlueyStyles.title(),
                        ),
                      ),
                    ),
                    Section(
                      sectionModel: sectionFamily,
                    ),
                    Section(
                      sectionModel: sectionSchoolFriends,
                    ),
                    Section(
                      sectionModel: sectionFamily,
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return const HomeLoadingPage();
      },
    );
  }
}

final sectionFamily = SectionModel(
  items: [
  SectionItemModel(
    name: "Bluey",
    img: "https://www.bluey.tv/wp-content/uploads/2023/07/Bluey-fixed-2.png",
    id: 1,
  ),
  SectionItemModel(
    name: "Bingo",
    img: "https://www.bluey.tv/wp-content/uploads/2023/07/Bingo-fixed-1.png",
    id: 2,
  ),
  SectionItemModel(
    name: "Dad",
    img: "https://www.bluey.tv/wp-content/uploads/2023/09/Bandit.png",
    id: 3,
  ),
  SectionItemModel(
    name: "Mum",
    img: "https://www.bluey.tv/wp-content/uploads/2023/09/Chilli-fixed.png",
    id: 4,
  )
  ],
  title: "Bluey's Family",
);

final sectionSchoolFriends = SectionModel(
  items: [
  SectionItemModel(
    img:
        "https://www.bluey.tv/wp-content/uploads/2023/09/Winton-fixed-grid.jpg",
    id: 1,
  ),
  SectionItemModel(
    img: "https://www.bluey.tv/wp-content/uploads/2023/09/HONEY-GRID.jpg",
    id: 3,
  ),
  SectionItemModel(
    img: "https://www.bluey.tv/wp-content/uploads/2023/09/COCO-GRID.jpg",
    id: 4,
  ),
  SectionItemModel(
    img: "https://www.bluey.tv/wp-content/uploads/2023/09/JACK-GRID.jpg",
    id: 4,
  )
  ],
  title: "School Friends",
);
