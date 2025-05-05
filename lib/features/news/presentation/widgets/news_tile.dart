import 'package:flutter/material.dart';
import 'package:news_app_flutter/data/news_model.dart';

class NewsListTile extends StatelessWidget {
  final NewsModel news;
  final VoidCallback onTap;

  const NewsListTile({
    super.key,
    required this.news,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: news.urlToImage.isNotEmpty
                ? Image.network(news.urlToImage, width: 100, fit: BoxFit.cover,) 
                : const SizedBox(width: 100,),
      title: Text(news.title),
      subtitle: Text(news.author),
      onTap: onTap,
    );
  }
}