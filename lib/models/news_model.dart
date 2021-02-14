class NewsModel {
  String title;
  String description;
  String urlToImage;

  NewsModel({this.title, this.description, this.urlToImage});

  factory NewsModel.fromJSON(Map map) {
    return NewsModel(
      title: map['title'],
      description: map['description'],
      urlToImage: map['urlToImage'],
    );
  }
}
