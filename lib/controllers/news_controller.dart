import 'package:flutter/material.dart';
import 'package:flutter_mvc/models/news_model.dart';
import 'package:flutter_mvc/repositories/news_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class NewsController extends ControllerMVC {
  List<NewsModel> newsModelList = List();

  var globalkey = GlobalKey<ScaffoldState>();

  NewsController() {
    //getTodayNews();
  }

  getTodayNews() async {
    try {
      newsModelList = await getNewsFromAPI();
      setState(() {});
    } catch (e) {
      globalkey.currentState.showSnackBar(
          SnackBar(content: Text("failed due to " + e.toString())));
    }
  }

  getTodayNewsAsStream() async {
    Stream<List<NewsModel>> dataStream = await getNewsFromAPIStream();
    dataStream.listen(
        (List<NewsModel> event) {
          setState(() {
            this.newsModelList = event;
          });

          print("getTodayNewsAsStream" + newsModelList.length.toString());
        },
        onDone: () {},
        onError: (e) {
          print("getTodayNewsAsStream " + e.toString());
        });
  }
}
