import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoreNewscontainer extends StatelessWidget {
  MoreNewscontainer({Key? key, required this.images, required this.title})
      : super(key: key);
  String title;
  String images;
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
            child:

 CachedNetworkImage(
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
                maxWidth: 250,
              ),
              child: Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ))
        ],
      ),
    );
  }
}
