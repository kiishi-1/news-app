import 'package:flutter/material.dart';
import 'package:flutter_news_app2/screens/read%20news%20view/read_news_view.dart';
import 'package:flutter_news_app2/screens/search%20view/search_view.dart';
import 'package:flutter_news_app2/screens/home%20view/main_new_skeleton.dart';
import 'package:flutter_news_app2/screens/home%20view/main_news_container.dart';
import 'package:flutter_news_app2/screens/home%20view/navigation_drawer.dart';
import 'package:flutter_news_app2/screens/home%20view/news_container.dart';
import 'package:flutter_news_app2/screens/home%20view/news_skeleton.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:flutter_news_app2/services/news_services.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  NewsServices newsServices = NewsServices();
  List<Map<String, dynamic>> currentData = [];
  bool isLoading = false;
  int page = 1;
  @override
  initState() {
    getCurrentData();
    super.initState();
  }

  getCurrentData() async {
    setState(() {
      isLoading = true;
    });
    currentData = await newsServices.getCurrentNews(q: "trending", page: page);
    print(currentData);
    print("it is printing");
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Builder(
              builder: (context) => IconButton(
                  onPressed: (() {
                    return Scaffold.of(context).openDrawer();
                  }),
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 32,
                  ))),
        ),
        drawer: NavigationDrawer(),
        // key: scaffoldKey,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ReadNewsView(
                                image: currentData[0]["media"] ?? "no image",
                                title: currentData[0]["title"],
                                date: //(DateFormat('dd, MMMM yyyy').format(
                                    currentData[0]["published_date"].toString(),
                                //)).toString(),
                                author: currentData[0]["author"] ?? "No Author",
                                summary: currentData[0]["summary"],
                                url: currentData[0]["link"],
                              ))));
                }),
                child: currentData.isEmpty
                    ? MainNewsSkeleton()
                    : MainNewsContainer(
                        title: currentData[0]["title"],
                        image: currentData[0]["media"],
                      ),
              ),
            ),
            // const SizedBox(height: 15,),
            SliverPinnedHeader(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Breaking News',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                    
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: const Divider(
              thickness: 1.0,
            )),
            currentData.isEmpty
                ? SliverToBoxAdapter(child: NewsSkeleton())
                : SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.9,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReadNewsView(
                                        image: currentData[index]["media"] ,
                                        title: currentData[index]["title"],
                                        date: currentData[index]
                                            ["published_date"],
                                        author: currentData[index]["author"] ??
                                            "No Author",
                                        summary: currentData[index]["summary"],
                                        url: currentData[index]["link"],
                                        // val: ,
                                        // key: ,
                                      )));
                        },
                        child: NewsContainer(
                          image: currentData[index]["media"] ?? "https://image.makewebeasy.net/makeweb/0/GYWrZvZVh/ADVICE/%E0%B8%94%E0%B8%B2%E0%B8%A7%E0%B8%99%E0%B9%8C%E0%B9%82%E0%B8%AB%E0%B8%A5%E0%B8%94_3__1.jpg"
                          // ? ""
                          // : "https://image.makewebeasy.net/makeweb/0/GYWrZvZVh/ADVICE/%E0%B8%94%E0%B8%B2%E0%B8%A7%E0%B8%99%E0%B9%8C%E0%B9%82%E0%B8%AB%E0%B8%A5%E0%B8%94_3__1.jpg"
                          ,
                          title: currentData[index]["title"],
                          date: currentData[index]["published_date"],
                          author: currentData[index]["author"] ?? "No Author",
                          //not all article has an author. so, if there is no author use the String No Author
                        ),
                      ),
                      childCount: currentData.length,
                    ),
                  )
            //  ],
            // ),
            // ),
            //  )
          ],
        ),
      ),
    );
  }
}
