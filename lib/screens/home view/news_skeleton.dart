import 'package:flutter/material.dart';
import 'package:flutter_news_app2/screens/home%20view/news_skeleton_item.dart';
import 'package:flutter_news_app2/widgets/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class NewsSkeleton extends StatelessWidget {
  const NewsSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.withOpacity(0.5),
        child: Column(
          children: [
            NewsSkeletonItem(),
            // const SizedBox(
            //   height: 4,
            // ),
            // NewsSkeletonItem(),
            // // const SizedBox(
            // //   height: 4,
            // // ),
            // NewsSkeletonItem(),
          ],
        ));
  }
}
