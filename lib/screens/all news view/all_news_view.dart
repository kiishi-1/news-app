import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app2/screens/read%20news%20view/read_news_view.dart';
//import 'package:flutter_news_app2/screens/search_result_view.dart';
import 'package:flutter_news_app2/services/news_services.dart';
import 'package:flutter_news_app2/screens/all%20news%20view/AllNewsContainer.dart';
import 'package:flutter_news_app2/screens/all%20news%20view/all_news_skeleton.dart';
import 'package:sliver_tools/sliver_tools.dart';

class AllNewsView extends StatefulWidget {
  AllNewsView({Key? key}) : super(key: key);

  @override
  State<AllNewsView> createState() => _AllNewsViewState();
}

class _AllNewsViewState extends State<AllNewsView> {
  NewsServices newsServices = NewsServices();
  List<Map<String, dynamic>> currentData = [];
  List<Map<String, dynamic>> newsList = [];
  bool isLoading = false;
  int page = 1;
  final ScrollController _scrollController = ScrollController();
  @override
  initState() {
    Future.delayed(Duration(seconds: 6), () => getCurrentData());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          currentData.isNotEmpty) {
        print('it must print');
        getMoreNews();
      }
    });
    super.initState();
  }

  getCurrentData() async {
    setState(() {
      isLoading = true;
    });
    currentData
        .addAll(await newsServices.getCurrentNews(q: "popular", page: page));
    //currentData.addAll cus after getting data from the services we add data into the empty list
    //and for pagenation, we want to keep adding to the . hence instead of currentData = , we use currentData.addAll
    //we use .add when it is an item and .addAll when it is a list
    //we use the key "page" when we want to pagenate, Then, we created a variable => page which will increment
    // hence, page: page
    //page_size is the number of items we have in a page
    //we have our 1st page when the list get the first set of items
    print(currentData);
    setState(() {
      isLoading = false;
    });
  }

  // getNews() async {
  //   newsList.addAll(await newsServices.getCurrentNews(q: "all", page: page));
  // }

  getMoreNews() async {
    page++;
    getCurrentData();
    setState(() {});
    print('getting more news');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPinnedHeader(
            child: Container(
              color: Colors.white,
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 3.5),
                  Text(
                    'Popular',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          currentData.isEmpty
              ? SliverToBoxAdapter(
                  child: AllNewsSkeleton(),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => GestureDetector(
                      onTap: (() {
                        print(MediaQuery.of(context).size.width / 2 - 70);
                        print(MediaQuery.of(context).size.width / 3.5);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReadNewsView(
                                      image: currentData[index]["media"] ??
                                          "no image",
                                      title: currentData[index]["title"],
                                      date: currentData[index]
                                          ["published_date"],
                                      author: currentData[index]["author"] ??
                                          "No Author",
                                      summary: currentData[index]["summary"],
                                      url: currentData[index]["link"],
                                    )));
                      }),
                      child: AllNewsContainer(
                          images: currentData[index]["media"],
                          title: currentData[index]["title"]),
                    ),
                    childCount: currentData.length,
                  ),
                ),
          currentData.isNotEmpty
              ? SliverToBoxAdapter(
                  child: SizedBox(
                      height: 50,
                      width: 60,
                      child: Center(child: CircularProgressIndicator())))
              : SliverToBoxAdapter(
                  child: const SizedBox(
                    height: 0,
                  ),
                )
        ],
      ),
    ));
  }
}
