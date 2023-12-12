import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class HomeLoadingPage extends StatelessWidget {
  const HomeLoadingPage({super.key});

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
                  Skeleton(height: 40, width: 150),
                  SizedBox(height: 24),
                  Skeleton(height: 20, width: 300),
                  SizedBox(height: 24),
                  SkeletonItems(),
                  SizedBox(height: 24),
                  SkeletonItems(),
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
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Skeleton(height: 20, width: 200)),
        SizedBox(height: 24),
        Skeleton(
          height: 300,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Skeleton(height: 200, width: 100),
                  SizedBox(
                    height: 16,
                  ),
                  Skeleton(height: 40, width: 100),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Skeleton(height: 200, width: 100),
                  SizedBox(
                    height: 16,
                  ),
                  Skeleton(height: 40, width: 100),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Skeleton(height: 200, width: 100),
                  SizedBox(
                    height: 16,
                  ),
                  Skeleton(height: 40, width: 100),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
