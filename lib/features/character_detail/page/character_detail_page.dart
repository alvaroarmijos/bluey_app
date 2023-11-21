import 'package:bluey_app/common/colors.dart';
import 'package:bluey_app/features/character_detail/bloc/character_bloc.dart';
import 'package:bluey_app/features/character_detail/model/character.dart';
import 'package:bluey_app/features/character_detail/page/character_detail_loading_page.dart';
import 'package:bluey_app/features/character_detail/widgets/bluey_description.dart';
import 'package:bluey_app/features/character_detail/widgets/bluey_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/view_state.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({super.key, required this.id});

  final int id;

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  void initState() {
    context.read<CharacterBloc>().add(CharacterFetchedEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        switch (state.status) {
          case ViewStatus.loading:
          case ViewStatus.failure:
            return const CharacterDetailLoadingPage();
          case ViewStatus.success:
            return state.character != null
                ? CharacterSuccess(character: state.character!)
                : const CharacterDetailLoadingPage();
        }
      },
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

class CharacterSuccess extends StatelessWidget {
  const CharacterSuccess({
    super.key,
    required this.character,
  });

  final Character character;

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
