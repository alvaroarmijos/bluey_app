import 'package:bluey_app/app/app_navigator.dart';
import 'package:bluey_app/common/colors.dart';
import 'package:bluey_app/common/drawables.dart';
import 'package:bluey_app/common/styles.dart';
import 'package:bluey_app/features/onboarding/widgets/start_button.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlueyColors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Flexible(
                child: Image.asset(
                  BlueyDrawables.getLogo(),
                  color: Colors.white,
                ),
              ),
              Image.asset(
                BlueyDrawables.getBlueyFamily(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 36),
                child: Text("Meet the characters", style: BlueyStyles.title()),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    BlueyDrawables.getBluey(),
                    height: 150,
                  ),
                  StartButton(
                    onTap: () => AppNavigator.navigateToHome(context),
                    label: "Start now",
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 36),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
