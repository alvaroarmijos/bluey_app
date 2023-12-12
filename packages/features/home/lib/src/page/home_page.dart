import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:home/src/widgets/section_view.dart';
import 'package:ui/ui.dart';
import 'package:utility/utility.dart';

import '../bloc/home_bloc.dart';
import 'home_loading_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(const SectionsFetchedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.status) {
          case ViewStatus.loading:
          case ViewStatus.failure:
            return const HomeLoadingPage();
          case ViewStatus.success:
            return HomeSuccess(
              sections: state.sections ?? [],
            );
        }
      },
    );
  }
}

class HomeSuccess extends StatelessWidget {
  const HomeSuccess({super.key, required this.sections});

  final List<Section> sections;

  @override
  Widget build(BuildContext context) {
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
              for (var i = 0; i < sections.length; i++)
                SectionView(
                  section: sections[i],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
