import 'package:bluey_app/app/app_navigator.dart';
import 'package:bluey_app/data/firebase_api/firebase_api_client.dart';
import 'package:bluey_app/features/character_detail/bloc/character_bloc.dart';
import 'package:bluey_app/features/home/bloc/home_bloc.dart';
import 'package:bluey_app/features/onboarding/page/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'features/character_detail/page/character_detail_page.dart';
import 'features/home/page/home_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navigator(
        key: navigatorKey,
        onGenerateRoute: _routeFactory,
      ),
    );
  }

  static Route<dynamic> _routeFactory(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case AppNavigator.ROUTE_MAIN_PAGE:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const OnboardingPage());
      case AppNavigator.ROUTE_HOME:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider(
            create: (_) =>
                HomeBloc(FirebaseApiClient(httpClient: http.Client())),
            child: const HomePage(),
          ),
        );
      case AppNavigator.ROUTE_CHARACTER:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider(
            create: (_) =>
                CharacterBloc(FirebaseApiClient(httpClient: http.Client())),
            child: CharacterDetailPage(
              id: args![AppNavigator.ARGS_CHARACTER_ID],
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name} on Main',
              ),
            ),
          ),
        );
    }
  }
}
