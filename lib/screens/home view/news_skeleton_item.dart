import 'package:flutter/material.dart';
import 'package:flutter_news_app2/widgets/skeleton.dart';

class NewsSkeletonItem extends StatelessWidget {
  const NewsSkeletonItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        height: 450,
        width: 170,

        // width: 150,
        margin: const EdgeInsets.all(1),
        padding: const EdgeInsets.all(1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 4,
            ),
            Container(
              height: 115,
              width: 165,
              // decoration: BoxDecoration(
              //   //borderRadius: BorderRadius.circular(12),
              // ),
              child: Skeleton(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 7,
                ),
                Container(
                  width: 155,
                  height: 20,
                  child: Skeleton(),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  width: 150,
                  height: 10,
                  child: Skeleton(),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  width: 150,
                  height: 10,
                  child: Skeleton(),
                ),
              ],
            )
          ],
        ),
      ),
      Container(
        height: 450,
        width: 170,

        // width: 150,
        margin: const EdgeInsets.all(1),
        padding: const EdgeInsets.all(1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 115,
              width: 165,
              // decoration: BoxDecoration(
              //   //borderRadius: BorderRadius.circular(12),
              // ),
              child: Skeleton(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 7,
                ),
                Container(
                  width: 155,
                  height: 20,
                  child: Skeleton(),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  width: 150,
                  height: 10,
                  child: Skeleton(),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  width: 150,
                  height: 10,
                  child: Skeleton(),
                ),
              ],
            )
          ],
        ),
      )
    ]);
  }
}
