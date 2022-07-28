import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app2/screens/search%20view/search_view.dart';
import 'package:flutter_news_app2/screens/home%20view/home_view.dart';

class MainNewsContainer extends StatelessWidget {
  MainNewsContainer({
    Key? key,
    required this.title,
    required this.image,
    //required this.onPressed
  }) : super(key: key);
  String title;
  String image;
  //Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //padding: const EdgeInsets.all(17),
          height: 280,
          width: double.infinity,
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(15),
            color: Colors.black,
          ),
          child: CachedNetworkImage(
            imageUrl: image,
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          clipBehavior: Clip.hardEdge,
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 280,
              width: double.infinity,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ),
        Positioned(
          left: 10,
          right: 0,
          top: 10,
          bottom: 0,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(1),
                  height: 65,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      // GestureDetector(
                      //   onTap: () =>
                      //        Navigator.push(
                      //            context,
                      //            MaterialPageRoute(
                      //                builder: ((context) => SearchView()))),

                      //       //onPressed,
                      //       // to pass data from home_view to search_view, the function onpressed was created
                      //   child: Icon(
                      //     Icons.menu,
                      //     color: Colors.white,
                      //   ),
                      // )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  height: 30,
                  width: 145,
                  decoration: BoxDecoration(
                    //color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text('News of the day',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  constraints: BoxConstraints(
                      maxHeight: 165,
                      maxWidth: MediaQuery.of(context).size.width - 100),
                  decoration: BoxDecoration(
                    //color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(7),
                  constraints: BoxConstraints(maxHeight: 65, maxWidth: 130),
                  decoration: BoxDecoration(
                    //color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Learn More',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
