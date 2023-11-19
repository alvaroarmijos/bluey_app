import 'package:bluey_app/common/colors.dart';
import 'package:bluey_app/common/drawables.dart';
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
              const Padding(
                padding: EdgeInsets.only(top: 16, bottom: 36),
                child: Text("Meet the characters",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Hello-Headline",
                        fontSize: 28)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    BlueyDrawables.getBluey(),
                    height: 150,
                  ),
                  const StartButton(
                    label: "Start now",
                    padding: EdgeInsets.only(left: 8, right: 36, top: 36),
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
