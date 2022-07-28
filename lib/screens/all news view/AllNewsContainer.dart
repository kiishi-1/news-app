import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AllNewsContainer extends StatelessWidget {
  AllNewsContainer({Key? key, required this.images, required this.title})
      : super(key: key);
  String images;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      constraints: BoxConstraints(
        maxHeight: 75,
        maxWidth: 260,
      ),
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
            child: images == null
                ? Container()
                : CachedNetworkImage(
                    imageUrl: images,
                    fit: BoxFit.cover,
                    // placeholder: (context, url) => new CircularProgressIndicator(),
                    // errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
            clipBehavior: Clip.hardEdge,
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 150),
              child: Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )),
          const SizedBox(
            width: 12,
          )
        ],
      ),
    );
  }
}
