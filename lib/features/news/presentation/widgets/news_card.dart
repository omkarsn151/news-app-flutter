import 'package:flutter/material.dart';
import 'package:news_app_flutter/core/constants/common_widgets/custom_text.dart';
import 'package:news_app_flutter/data/news_model.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;
  final VoidCallback onTap;

  const NewsCard({
    super.key,
    required this.news,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Container(
                height: 180,
                width: double.infinity,
                color: Colors.grey[200],
                child: news.urlToImage.isNotEmpty
                    ? Image.network(
                        news.urlToImage,
                        fit: BoxFit.cover,
                        errorBuilder: (ctx, error, _) => Center(
                          child: Icon(Icons.image_not_supported, size: 40, color: Colors.grey[400]),
                        ),
                      )
                    : Center(
                        child: Icon(Icons.newspaper, size: 40, color: Colors.grey[400]),
                      ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: CustomText(
                          text: news.sourceName.isNotEmpty ? news.sourceName : 'Unknown Source',
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      CustomText(
                        text: getTimeAgo(news.publishedAt),
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  
                  CustomText(
                    text: news.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  SizedBox(height: 8),
                  
                  CustomText(
                    text: news.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                  
                  SizedBox(height: 12),
                  
                  if (news.author.isNotEmpty)
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            Icons.person,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: CustomText(
                            text: news.author,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}