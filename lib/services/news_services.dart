import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsServices {
  final String apiHost = 'X-RapidAPI-Host';
  final String api = 'X-RapidAPI-Key';
  final String hostKey = 'free-news.p.rapidapi.com';
  final String apiKey = '47be25f2b2msh412286e8ef08c7dp1ab9e4jsn7d71e8d4981f';

  Future<List<Map<String, dynamic>>> getCurrentNews(
      { String? q, required int page}) async {
    http.Response response = await http.get(
      Uri.parse(
          'https://free-news.p.rapidapi.com/v1/search?q=$q&page=$page&page_size=10'),
      //we use the key "page" when we want to pagenate
      //page_size is the number of items we have in a page
      //we have our 1st page when the list get the first set of items
      headers: {apiHost: hostKey, api: apiKey},
    );
    final data = jsonDecode(response.body)["articles"];
    print(data);

    final List<Map<String, dynamic>> newsData = List<Map<String, dynamic>>.from(
      data.map((e) => e),
    );
    return newsData;
  }
}
