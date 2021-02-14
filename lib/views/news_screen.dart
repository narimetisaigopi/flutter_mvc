import 'package:flutter/material.dart';
import 'package:flutter_mvc/controllers/news_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends StateMVC<NewsScreen> {
  NewsController _newsController = NewsController();

  _NewsScreenState() : super(NewsController());

  @override
  void initState() {
    _newsController.getTodayNewsAsStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("News"),
      ),
      body: _newsController.newsModelList.length > 0
          ? ListView.builder(
              itemCount: _newsController.newsModelList.length,
              itemBuilder: (con, index) {
                return Card(
                  child: ListTile(
                    title: Image.network(
                        _newsController.newsModelList[index].urlToImage),
                    subtitle: Text(_newsController.newsModelList[index].title),
                  ),
                );
              })
          : Center(child: CircularProgressIndicator()),
    );
  }
}
