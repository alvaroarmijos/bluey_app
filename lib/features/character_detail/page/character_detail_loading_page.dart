import 'package:bluey_app/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/widgets/skeleton.dart';

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
                  SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Skeleton(height: 300, width: 200),
                      SizedBox(width: 16),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Skeleton(height: 20, width: 100),
                          SizedBox(height: 24),
                          Skeleton(height: 50, width: 100),
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
    return const Skeleton(
      height: 450,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Skeleton(height: 20, width: 200),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton(height: 20, width: 60),
                  SizedBox(height: 24),
                  Skeleton(height: 20, width: 100),
                  SizedBox(height: 24),
                  Skeleton(height: 20, width: 60),
                  SizedBox(height: 24),
                  Skeleton(height: 20, width: 100),
                  SizedBox(height: 24),
                  Skeleton(height: 20, width: 60),
                  SizedBox(height: 24),
                  Skeleton(height: 20, width: 100),
                  SizedBox(height: 24),
                  Skeleton(height: 100, width: 100),
                ],
              ),
              SizedBox(width: 16),
              Skeleton(height: 200, width: 100),
            ],
          )
        ],
      ),
    );
  }
}
