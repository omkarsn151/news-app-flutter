class NewsModel {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final String sourceName;
  final String author;
  final DateTime publishedAt;

  NewsModel({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.sourceName,
    required this.author,
    required this.publishedAt,
  });

    factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      content: json['content'] ?? '',
      sourceName: json['source']?['name'] ?? '',
      author: json['author'] ?? '',
      publishedAt: DateTime.tryParse(json['publishedAt'] ?? '') ?? DateTime.now(),
    );
  }
}
