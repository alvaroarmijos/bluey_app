import 'package:bluey_app/data/firebase_api/firebase_api_client.dart';
import 'package:bluey_app/features/character_detail/bloc/character_bloc.dart';
import 'package:bluey_app/features/home/bloc/home_bloc.dart';
import 'package:bluey_app/features/onboarding/page/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(FirebaseApiClient(httpClient: http.Client())),
        ),
        BlocProvider(
          create: (_) => CharacterBloc(
            FirebaseApiClient(httpClient: http.Client()),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingPage(),
      ),
    );
  }
}
