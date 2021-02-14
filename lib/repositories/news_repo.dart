import 'dart:convert';

import 'package:flutter_mvc/models/news_model.dart';
import 'package:http/http.dart' as http;

Future<List<NewsModel>> getNewsFromAPI() async {
  var data = await http.get("Keep your URL");

  var jsonData = json.decode(data.body);

//  NewsModel.fromJSON(jsonData["aritcal"]);

  return (jsonData['articles'] as List)
      .map((e) => NewsModel.fromJSON(e))
      .toList();
}

Future<Stream<List<NewsModel>>> getNewsFromAPIStream() async {
  try {
    var streamData = http.get("Keep your URL").asStream();

    return streamData.map((event) {
      var jsonData = json.decode(event.body);

      return (jsonData['articles'] as List)
          .map((e) => NewsModel.fromJSON(e))
          .toList();
    });
  } catch (e) {
    return Stream.value([]);
  }
}
