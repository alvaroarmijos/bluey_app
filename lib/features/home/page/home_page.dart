import 'package:bluey_app/common/colors.dart';
import 'package:bluey_app/common/drawables.dart';
import 'package:bluey_app/common/styles.dart';
import 'package:bluey_app/features/home/bloc/home_bloc.dart';
import 'package:bluey_app/features/home/model/section_model.dart';
import 'package:bluey_app/features/home/page/home_loading_page.dart';
import 'package:bluey_app/features/home/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc bloc;

  @override
  void initState() {
    bloc = context.read<HomeBloc>()..add(const SectionsFetchedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.status) {
          case HomeStatus.loading:
          case HomeStatus.failure:
            return const HomeLoadingPage();
          case HomeStatus.success:
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

  final List<SectionModel> sections;

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
                Section(
                  sectionModel: sections[i],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
