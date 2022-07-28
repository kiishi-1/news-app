import 'package:flutter/material.dart';
import 'package:flutter_news_app2/widgets/skeleton.dart';
import 'package:flutter_news_app2/widgets/skeleton_item.dart';
import 'package:shimmer/shimmer.dart';

class MoreNewsSkeleton extends StatelessWidget {
  const MoreNewsSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.withOpacity(0.5),
      child: Column(
        children: [
          ...List.generate(6, (index) => SkeletonItem())
         
        ],
      ),
    );
  }
}
