import 'package:flutter/material.dart';
import 'package:news_app_flutter/data/news_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel news;
  const NewsDetailScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(news.author),),
      body: Column(
        children: [
          Text(news.content),
        ],
      ),
    );
  }
}