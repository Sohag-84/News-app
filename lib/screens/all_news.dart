// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:new_app/components/news_item_list.dart';
import 'package:new_app/models/news_model.dart';
import 'package:new_app/services/api_services.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  @override
Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices().getAllNews(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<NewsModel> breakingNewsList = snapshot.data ?? [];
          return ListView.builder(
            itemCount: breakingNewsList.length,
            itemBuilder: (context, index) {
              return NewsItemList(newsModel: breakingNewsList[index]);
            },
          );
        }
      },
    );
  }
}
