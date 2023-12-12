import 'package:character_detail/character_detail.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:onboarding/onboarding.dart';
import 'package:ui/ui.dart';
import 'package:utility/utility.dart';

import 'app/di/injection_container.dart' as di;

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await di.configureDependencies();
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
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(
    //       create: (_) => di.sl<HomeBloc>(),
    //     ),
    //     BlocProvider(
    //       create: (_) => di.sl<CharacterBloc>(),
    //     ),
    //   ],
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: Navigator(
    //       key: navigatorKey,
    //       onGenerateRoute: _routeFactory,
    //     ),
    //   ),
    // );
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
            create: (_) => di.sl<HomeBloc>(),
            child: const HomePage(),
          ),
        );
      case AppNavigator.ROUTE_CHARACTER:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider(
            create: (_) => di.sl<CharacterBloc>(),
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
