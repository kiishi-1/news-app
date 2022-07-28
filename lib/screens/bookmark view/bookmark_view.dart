import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app2/screens/all_functions.dart';
import 'package:flutter_news_app2/screens/read%20news%20view/read_news_view.dart';
import 'package:flutter_news_app2/services/news_services.dart';
import 'package:flutter_news_app2/screens/bookmark%20view/bookmark_container.dart';
import 'package:sliver_tools/sliver_tools.dart';

class BookmarkView extends StatefulWidget {
  const BookmarkView({Key? key}) : super(key: key);

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  NewsServices newsServices = NewsServices();
  // final AllFunction _allFunction = AllFunction();
  // there's no need for us to instanciate the class Allfunction since it's static

  bool isLoading = false;

  openDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // title: Text('About the App'),
        content: Container(
            height: 50,
            width: 150,
            alignment: Alignment.center,
            child: Text('Are you sure ?')),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    AllFunction.bookmarkList.clear();
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black),
                  )),
              const SizedBox(
                width: 50,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'No',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black),
                  ))
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: AllFunction.bookmarkList.isEmpty
          //AllFunction.bookmarkList and not _allFunction.bookmarkList cus the class AllFunction was not instanciated since it's static
          ? Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: Colors.grey[800],
                    width: double.infinity,
                    height: 70,
                    child: GestureDetector(
                      onTap: () {
                        print(AllFunction.bookmarkList.length);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 2.8),
                  Text(
                    "No BookMark",
                    style: TextStyle(color: Colors.grey[500], fontSize: 15),
                  )
                ],
              ),
            )
          : CustomScrollView(
              slivers: [
                SliverPinnedHeader(
                    child: Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.grey[800],
                  width: double.infinity,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: (() {
                            Navigator.pop(context);
                          }),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                      const Spacer(),
                      AllFunction.bookmarkList.length > 1
                          ? GestureDetector(
                              onTap: (() {
                                openDialog();
                              }),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ))
                          : Container(),
                    ],
                  ),
                )),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => GestureDetector(
                              onTap: (() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => ReadNewsView(
                                              bookmarked: true,
                                              image: AllFunction
                                                          .bookmarkList[index]
                                                      ["image"] ??
                                                  "https://image.makewebeasy.net/makeweb/0/GYWrZvZVh/ADVICE/%E0%B8%94%E0%B8%B2%E0%B8%A7%E0%B8%99%E0%B9%8C%E0%B9%82%E0%B8%AB%E0%B8%A5%E0%B8%94_3__1.jpg",
                                              // using ["image"] and not ["media"] cus when we're adding to bookmark we created a key "image" to hold what ever data, in this case, the image we're getting from the api
                                              //AllFunction.bookmarkList and not _allFunction.bookmarkListl cus the class AllFunction was not instanciated since it's static
                                              title: AllFunction
                                                  .bookmarkList[index]["title"],
                                              author: AllFunction
                                                      .bookmarkList[index]
                                                  ["author"],
                                              date: AllFunction
                                                  .bookmarkList[index]["date"],
                                              summary: AllFunction
                                                      .bookmarkList[index]
                                                  ["summary"],
                                              url: AllFunction
                                                  .bookmarkList[index]["url"],
                                              // using ["url"] and not ["link"] cus when we're adding to bookmark we created a key "url" to hold what ever data, in this case, the link we're getting from the api
                                            ))));
                              }),
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(12),
                                width: double.infinity,
                                constraints:
                                    const BoxConstraints(maxHeight: 145),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey,
                                ),
                                child: Row(
                                  children: [
                                    BookmarkContainer(
                                      image: AllFunction.bookmarkList[index]
                                          ["image"],
                                      //using ["image"] and not ["media"] cus when we're adding to bookmark we created a key "image" to hold what ever data, in this case image we're getting from the api
                                      //AllFunction.bookmarkList and not _allFunction.bookmarkListl cus the class AllFunction was not instanciated since it's static
                                      title: AllFunction.bookmarkList[index]
                                          ["title"],
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            AllFunction.removeFromBookmark({
                                              "image": AllFunction
                                                  .bookmarkList[index]["image"],
                                              //using ["image"] and not ["media"] cus when we're adding to bookmark we created a key "image" to hold what ever data, in this case image we're getting from the api
                                              //AllFunction.bookmarkList and not _allFunction.bookmarkListl cus the class AllFunction was not instanciated since it's static
                                              "title": AllFunction
                                                  .bookmarkList[index]["title"],
                                              "date": AllFunction
                                                  .bookmarkList[index]["date"],
                                              "summary": AllFunction
                                                      .bookmarkList[index]
                                                  ["summary"],
                                              "author": AllFunction
                                                      .bookmarkList[index]
                                                  ["author"],
                                              "url": AllFunction
                                                  .bookmarkList[index]["link"]
                                            });
                                          });
                                          final text = 'Removed From Bookmark';
                                          final snackBar = SnackBar(
                                            elevation: 5,
                                            backgroundColor: Colors.black,
                                            duration: Duration(seconds: 4),
                                            content: Text(
                                              text,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                            ..hideCurrentSnackBar()
                                            ..showSnackBar(snackBar);
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                        childCount: AllFunction.bookmarkList.length))
              ],
            ),
    ));
  }
}
