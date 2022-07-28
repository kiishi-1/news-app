import 'package:flutter/material.dart';
import 'package:flutter_news_app2/screens/all%20news%20view/all_news_view.dart';
import 'package:flutter_news_app2/screens/bookmark%20view/bookmark_view.dart';
import 'package:flutter_news_app2/screens/home%20view/home_view.dart';
import 'package:flutter_news_app2/screens/search%20view/search_view.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        //color: Color.fromARGB(255, 1, 20, 52),
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                margin: const EdgeInsets.all(12),
                child: Text(
                  'Navigate',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ListTile(
                leading: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 15,
                ),
                title: Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchView()));
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 15,
                ),
                title: Text(
                  'Popular',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AllNewsView()));
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 15,
                ),
                title: Text(
                  'Bookmark',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BookmarkView())
                );
                 },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
