import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app2/screens/read%20news%20view/read_more_container.dart';
import 'package:flutter_news_app2/screens/webview/webview.dart';
import 'package:flutter_news_app2/services/news_services.dart';
import 'package:flutter_news_app2/screens/read%20news%20view/read_news_container.dart';
import 'package:flutter_news_app2/screens/read%20news%20view/text_container.dart';
import 'package:sliver_tools/sliver_tools.dart';
//import 'package:flutter_news_app2/screens/read%20news%20view/text_container.dart';
import 'package:flutter_news_app2/screens/all_functions.dart';

class ReadNewsView extends StatefulWidget {
  ReadNewsView(
      {Key? key,
      required this.image,
      this.bookmarked,
      required this.title,
      required this.author,
      required this.date,
      required this.summary,
      required this.url})
      : super(key: key);
  String image;
  bool? bookmarked;
  String title;
  String date;
  String author;
  String summary;
  String url;
  @override
  State<ReadNewsView> createState() => _ReadNewsViewState();
}

class _ReadNewsViewState extends State<ReadNewsView> {
  // AllFunction _allFunction = AllFunction();
  @override
  initState() {
    widget.bookmarked = widget.bookmarked == null ? false : widget.bookmarked!;
    //when we are passing data form bookmarkview widget.bookmarked is true, when entering from any other view it'll be false
    //hence let widget.bookmarked = false, if widget.bookmarked == null i.e when entering readnewsview  from any other view that is not bookmarkview
    //we're doing this so that when we click on the icon in the readnewsview, it doesn't create the same news more than once
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: widget.bookmarked == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child:
                        // ReadNewsContainer(
                        //   author: widget.author,
                        //   date: widget.date,
                        //   image: widget.image,
                        // ),
                        Stack(
                      children: [
                        Container(
                          //padding: const EdgeInsets.all(17),
                          height: 260,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                          child: widget.image == null
                              ? Container()
                              : CachedNetworkImage(
                                  imageUrl: widget.image,
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
                              height: 260,
                              width: double.infinity,
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 5,
                            right: 5,
                            top: 5,
                            bottom: 5,
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    height: 65,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () => Navigator.pop(context),
                                            child: Container(
                                              height: 60,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: const Icon(
                                                Icons.arrow_back_ios,
                                                color: Colors.white,
                                              ),
                                            )),
                                        const Spacer(),
                                        GestureDetector(
                                            child: Container(
                                                height: 60,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Center(
                                                  child: IconButton(
                                                    onPressed: () {
                                                  setState(() {
                                                    widget.bookmarked =
                                                        !widget.bookmarked!;

                                                    if (widget
                                                        .bookmarked!) {
                                                      //AllFunction.bookmarkList and not _allFunction.bookmarkList cus the class AllFunction was not instanciated since it's static
                                                      AllFunction
                                                          .addToBookmark({
                                                        "image":
                                                            widget.image,
                                                        "title":
                                                            widget.title,
                                                        "date": widget.date,
                                                        "summary":
                                                            widget.summary,
                                                        "author":
                                                            widget.author,
                                                        "url": widget.url,
                                                        //you passing the data you're getting from the API
                                                      });
                                                      print(AllFunction
                                                          .bookmarkList
                                                          .length);
                                                      final text =
                                                          'Added To Bookmark';
                                                      final snackBar =
                                                          SnackBar(
                                                        elevation: 5,
                                                        backgroundColor:
                                                            Colors.black,
                                                        duration: Duration(
                                                            seconds: 4),
                                                        content: Text(
                                                          text,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white),
                                                        ),
                                                        // action: SnackBarAction(
                                                        //   label: 'UNDO',
                                                        //   textColor: Colors.white,
                                                        //   onPressed: (){},
                                                        // ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                          context)
                                                        ..hideCurrentSnackBar()
                                                        ..showSnackBar(
                                                            snackBar);
                                                    } else {
                                                      AllFunction
                                                          .removeFromBookmark({
                                                        "image":
                                                            widget.image,
                                                        "title":
                                                            widget.title,
                                                        "date": widget.date,
                                                        "summary":
                                                            widget.summary,
                                                        "author":
                                                            widget.author,
                                                        "url": widget.url,
                                                        //you passing the data you're getting from the API
                                                      });

                                                      print(AllFunction
                                                          .bookmarkList
                                                          .length);
                                                      final text =
                                                          'Removed From Bookmark';
                                                      final snackBar =
                                                          SnackBar(
                                                        elevation: 5,
                                                        backgroundColor:
                                                            Colors.black,
                                                        duration: Duration(
                                                            seconds: 4),
                                                        content: Text(
                                                          text,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white),
                                                        ),
                                                        // action: SnackBarAction(
                                                        //   label: 'UNDO',
                                                        //   textColor: Colors.white,
                                                        //   onPressed: (){},
                                                        // ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                          context)
                                                        ..hideCurrentSnackBar()
                                                        ..showSnackBar(
                                                            snackBar);
                                                    }
                                                  });
                                                    },
                                                    icon: Icon(
                                                  widget.bookmarked!
                                                      ? Icons.bookmark_add
                                                      : Icons
                                                          .bookmark_add_outlined,
                                                  color: Colors.white,
                                                    ),
                                                  ),
                                                ))),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      height: 90,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          const Spacer(),
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            constraints: const BoxConstraints(
                                              maxHeight: 75,
                                              maxWidth: 270,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(widget.author,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  widget.date,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                  SliverPinnedHeader(
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      padding: const EdgeInsets.all(1),
                      constraints: const BoxConstraints(maxHeight: 150),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            constraints: const BoxConstraints(maxHeight: 150),
                            width: 7,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 1, 20, 52),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Container(
                            padding: const EdgeInsets.all(1),
                            constraints: BoxConstraints(
                                maxHeight: 130,
                                maxWidth:
                                    MediaQuery.of(context).size.width - 100),
                            //color: Colors.black,
                            child: Text(
                              widget.title,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TextContainer(
                      summary: widget.summary,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: const SizedBox(
                      height: 15,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Webview(url: widget.url)));
                      }),
                      child: Align(
                        alignment: Alignment.center,
                        child: ReadMoreContainer(),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 25,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
