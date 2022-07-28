import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app2/screens/read%20news%20view/read_news_view.dart';
import 'package:flutter_news_app2/screens/search%20result%20view/search_result_view2.dart';
import 'package:flutter_news_app2/services/news_services.dart';
import 'package:flutter_news_app2/screens/search%20view/more_news_container.dart';
import 'package:flutter_news_app2/screens/search%20view/more_news_skeleton.dart';
import 'package:flutter_news_app2/screens/home%20view/navigation_drawer.dart';
import 'package:flutter_news_app2/screens/search%20view/navigation_drawer2.dart';
import 'package:flutter_news_app2/screens/search%20result%20view/news_categories_container.dart';
import 'package:sliver_tools/sliver_tools.dart';
//import 'package:flutter_news_app2/screens/search_result_view.dart';

class SearchView extends StatefulWidget {
  SearchView({
    Key? key,
    //required this.currentData,
  }) : super(key: key);
  //List<Map<String, dynamic>> currentData = [];

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  NewsServices newsServices = NewsServices();
  List<Map<String, dynamic>> currentData = [];
  List<String> newsCategories = [
    'Tech',
    'Politics',
    'Art',
    'Food',
    'Sport',
    'Entertainment',
    'Health',
  ];
  TextEditingController controller1 = TextEditingController();
  bool isLoading = false;
  int selectedIndex = 0;
  int page = 1;

  @override
  initState() {
    Future.delayed(Duration(seconds: 4),
        () => getCurrentData(newsCategories[selectedIndex]));
    //getCurrentData(newsCategories[selectedIndex]) get the String in the index e.g "health" and sends it to getCurrentData(qq)
    //which will now be sent to our services(api) that is to newsServices.getCurrentNews(q: qq)
    super.initState();
  }

  getCurrentData(qq) async {
    setState(() {
      isLoading = true;
    });
    currentData = await newsServices.getCurrentNews(q: qq, page: page);
    print(currentData);
    setState(() {
      isLoading = false;
    });
  }

  getMoreNews(q) {
    page++;
    //if (page < newsServices.totalPages) {
    getCurrentData(q);

    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
              builder: (context) => IconButton(
                  onPressed: (() {
                    return Scaffold.of(context).openDrawer();
                  }),
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 32,
                  ))),
        ),
        drawer: NavigationDrawer2(),
        backgroundColor: Colors.white,
        body: CustomScrollView(slivers: [
          SliverPinnedHeader(
            child: Container(
              padding: const EdgeInsets.all(17),
              height: 295,
              width: double.infinity,
              color: Colors.white,
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
                        GestureDetector(
                            child: Icon(
                          Icons.menu,
                          color: Colors.black,
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Text(
                    'Discover',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'News from all over the world',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    width: double.infinity,
                    height: 55,
                    child: TextFormField(
                      onFieldSubmitted: (value) {
                        value = controller1.text;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchResultView2(
                                      val: value,
                                    )));
                      },
                      controller: controller1,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search',
                          hintMaxLines: 1,
                          hintStyle:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1,
                              //style: BorderStyle.solid,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ))),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPinnedHeader(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                      newsCategories.length,
                      (index) => Container(
                            color: Colors.white,
                            child: GestureDetector(
                                onTap: () {
                                  currentData = [];
                                  //the loading indicator only shows when the list is empty,
                                  setState(() {});
                                  //print(selectedIndex);
                                  selectedIndex = index;
                                  getCurrentData(newsCategories[selectedIndex]);
                                  //we're calling the function with our new index, the new index in selectedIndex

                                  setState(() {});
                                },
                                child: NewCategoriesContainer(
                                    textColor: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    color: selectedIndex == index
                                        ? Colors.black
                                        : Colors.transparent,
                                    text: newsCategories[index])),
                          ))
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 20,
            ),
          ),
          currentData.isEmpty
              ? SliverToBoxAdapter(
                  child: MoreNewsSkeleton(),
                )
              : SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        ...List.generate(
                            currentData.length,
                            (index) => GestureDetector(
                                  onTap: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => ReadNewsView(
                                                  image: currentData[index]
                                                              ["media"] ??
                                                          "https://image.makewebeasy.net/makeweb/0/GYWrZvZVh/ADVICE/%E0%B8%94%E0%B8%B2%E0%B8%A7%E0%B8%99%E0%B9%8C%E0%B9%82%E0%B8%AB%E0%B8%A5%E0%B8%94_3__1.jpg"
                                                      // ? ""
                                                      // : "https://image.makewebeasy.net/makeweb/0/GYWrZvZVh/ADVICE/%E0%B8%94%E0%B8%B2%E0%B8%A7%E0%B8%99%E0%B9%8C%E0%B9%82%E0%B8%AB%E0%B8%A5%E0%B8%94_3__1.jpg"
                                                      ,
                                                  //we are catering for if when it's null or empty String
                                                  title: currentData[index]
                                                      ["title"],
                                                  date: currentData[index]
                                                      ["published_date"],
                                                  author: currentData[index]
                                                          ["author"] ??
                                                      "No Author",
                                                  summary: currentData[index]
                                                      ["summary"],
                                                      url: currentData[index]["link"],
                                                ))));
                                  }),
                                  child: MoreNewscontainer(
                                      images: currentData[index]["media"],
                                      title: currentData[index]["title"]),
                                ))
                      ],
                    ),
                  ),
                ),
        ]),
      ),
    );
  }
}
