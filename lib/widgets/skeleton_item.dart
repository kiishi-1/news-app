import 'package:flutter/material.dart';
import 'package:flutter_news_app2/widgets/skeleton.dart';

class SkeletonItem extends StatelessWidget {
  const SkeletonItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.all(1),
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(maxHeight: 85),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey,
                  ),
                  child: Skeleton(
                    width: 64,
                    height: 64,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 250,
                      ),
                      child: Skeleton(
                        width: 240,
                        height: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 250,
                      ),
                      child: Skeleton(
                        width: 240,
                        height: 10,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );

  }
}