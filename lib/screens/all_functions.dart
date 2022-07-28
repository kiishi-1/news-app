import 'package:flutter_news_app2/services/news_services.dart';

class AllFunction {
  NewsServices newsServices = NewsServices();
  int page = 1;
  static  List<Map<String, dynamic>> bookmarkList = [];
  //static creates one instance of a variable through out the app



  static addToBookmark(Map<String, dynamic> item) {
    bookmarkList.add(item);
  }
  

  static removeFromBookmark(Map<String, dynamic> item) {
    bookmarkList.removeWhere((element) => element["title"] == item["title"]);
  }
}
