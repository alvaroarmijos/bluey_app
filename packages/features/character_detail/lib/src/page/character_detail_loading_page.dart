import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class CharacterDetailLoadingPage extends StatelessWidget {
  const CharacterDetailLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlueyColors.blue,
      body: SafeArea(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Skeleton(height: 170, width: 130),
                      SizedBox(width: 50),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Skeleton(height: 20, width: 150),
                          SizedBox(height: 24),
                          Skeleton(height: 50, width: 150),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 24),
                  Skeleton(height: 100, width: double.infinity),
                  SizedBox(height: 24),
                  SkeletonItems(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SkeletonItems extends StatelessWidget {
  const SkeletonItems({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Skeleton(
        height: 400,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 12,
            ),
            Skeleton(height: 32, width: 200),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skeleton(height: 20, width: 60),
                    SizedBox(height: 8),
                    Skeleton(height: 20, width: 100),
                    SizedBox(height: 8),
                    Skeleton(height: 20, width: 60),
                    SizedBox(height: 8),
                    Skeleton(height: 20, width: 100),
                    SizedBox(height: 8),
                    Skeleton(height: 20, width: 60),
                    SizedBox(height: 8),
                    Skeleton(height: 20, width: 100),
                    SizedBox(height: 8),
                    Skeleton(height: 100, width: 100),
                  ],
                ),
                SizedBox(width: 24),
                Skeleton(height: 200, width: 100),
              ],
            )
          ],
        ),
      ),
    );
  }
}
