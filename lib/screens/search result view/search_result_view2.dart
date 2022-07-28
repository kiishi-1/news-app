import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app2/screens/read%20news%20view/read_news_view.dart';
//import 'package:flutter_news_app2/screens/search_result_view.dart';
import 'package:flutter_news_app2/services/news_services.dart';
import 'package:flutter_news_app2/screens/search%20result%20view/search_news_container.dart';
import 'package:flutter_news_app2/screens/search%20result%20view/search_result_skeleton.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SearchResultView2 extends StatefulWidget {
  SearchResultView2({Key? key, required this.val}) : super(key: key);
  String val;

  @override
  State<SearchResultView2> createState() => _SearchResultView2State();
}

class _SearchResultView2State extends State<SearchResultView2> {
  NewsServices newsServices = NewsServices();
  List<Map<String, dynamic>> currentData = [];
  bool isLoading = false;
  int page = 1;
  ScrollController _scrollController = ScrollController();
  @override
  initState() {
    Future.delayed(Duration(seconds: 8), () => getCurrentData(widget.val));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          currentData.isNotEmpty) {
        getMoreResult();
      }
    });
    super.initState();
  }

  getCurrentData(qq) async {
    setState(() {
      isLoading = true;
    });
    currentData.addAll(
        await newsServices.getCurrentNews(q: qq ?? "trending", page: page));

    print(currentData);
    setState(() {
      isLoading = false;
    });
  }

  getMoreResult() {
    page++;
    getCurrentData(widget.val);
    setState(() {});
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
                ],
              ),
            ),
          ),
          currentData.isEmpty
              ? SliverToBoxAdapter(
                  child: SearchResultSkeleton(),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => GestureDetector(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReadNewsView(
                                      image: currentData[index]["media"],
                                      title: currentData[index]["title"],
                                      date: currentData[index]
                                          ["published_date"],
                                      author: currentData[index]["author"] ??
                                          "No Author",
                                      summary: currentData[index]["summary"],
                                      url: currentData[index]["link"],
                                    )));
                      }),
                      child: SearchNewsContainer(
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
