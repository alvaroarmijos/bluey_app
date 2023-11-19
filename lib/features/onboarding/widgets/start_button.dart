import 'package:bluey_app/common/colors.dart';
import 'package:bluey_app/common/styles.dart';
import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key, this.padding, required this.label, this.onTap});

  final EdgeInsets? padding;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                // width: 200,
                decoration: const ShapeDecoration(
                  color: BlueyColors.blueDark,
                  shape: StadiumBorder(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      child: Text(label, style: BlueyStyles.title()),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Transform.translate(
                  offset: const Offset(10, 0),
                  child: const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.white,
                    size: 72,
                    fill: 0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
