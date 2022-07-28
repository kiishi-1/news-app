import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  NewsContainer(
      {Key? key,
      required this.title,
      required this.date,
      required this.author,
      required this.image})
      : super(key: key);
  String title;
  String date;
  String author;
  String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 450,
        maxWidth: 170,
      ),
      // width: 150,
      margin: const EdgeInsets.fromLTRB(4, 3, 2, 3),
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 115,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child:
                // image == null
                //     ? Container()
                //     :
                CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              // placeholder: (context, url) => new CircularProgressIndicator(),
              // errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
            clipBehavior: Clip.hardEdge,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                author,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black38),
              ),
              Text(
                date,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black38),
              ),
            ],
          )
        ],
      ),
    );
  }
}
