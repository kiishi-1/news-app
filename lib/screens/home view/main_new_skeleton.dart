import 'package:flutter/material.dart';
import 'package:flutter_news_app2/widgets/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class MainNewsSkeleton extends StatelessWidget {
  const MainNewsSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.withOpacity(0.5),
      child: Stack(
        children: [
          Container(
            //padding: const EdgeInsets.all(17),
            height: 280,
            width: double.infinity,
            // decoration: BoxDecoration(
            //     //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
            //     ),
            child: Skeleton( isRounded: false,),
          ),
          Positioned(
            left: 10,
            right: 0,
            top: 65,
            bottom: 0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    // padding: const EdgeInsets.all(4),
                    // height: 30,
                    // width: 145,
                    decoration: BoxDecoration(
                      //color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Skeleton(
                      width: 130,
                      height: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      //color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Skeleton(
                      width: 250,
                      height: 70,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      //color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Skeleton(
                      width: 150,
                      height: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
