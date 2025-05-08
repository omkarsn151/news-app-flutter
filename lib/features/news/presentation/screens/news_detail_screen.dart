import 'package:flutter/material.dart';
import 'package:news_app_flutter/core/constants/common_widgets/custom_text.dart';
import 'package:news_app_flutter/data/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel news;
  const NewsDetailScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: news.urlToImage.isNotEmpty
                    ? Image.network(
                        news.urlToImage,
                        fit: BoxFit.cover,
                        errorBuilder: (ctx, error, _) => Container(
                          color: Colors.grey[300],
                          child: Center(
                            child: Icon(Icons.image_not_supported, size: 64, color: Colors.grey[400]),
                          ),
                        ),
                      )
                    : Container(
                        color: Colors.grey[300],
                        child: Center(
                          child: Icon(Icons.newspaper, size: 64, color: Colors.grey[400]),
                        ),
                      ),
              ),
            ),
            
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: CustomText(
                            text: news.sourceName.isNotEmpty ? news.sourceName : 'Unknown Source',
                            color: Colors.purple.shade600,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        CustomText(
                          text: getTimeAgo(news.publishedAt),
                          color: Colors.grey[700],
                          fontSize: 14,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    
                    CustomText(
                      text: news.title,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    SizedBox(height: 16),
                    
                    if (news.author.isNotEmpty)
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey[200],
                            child: Icon(
                              Icons.person,
                              size: 24,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: news.author,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                                CustomText(
                                  text: 'Author',
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    
                    Divider(height: 32),
                    
                    CustomText(
                      text: news.description,
                      fontSize: 16,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 16),
                    CustomText(
                      text: news.content,
                      fontSize: 15,
                      color: Colors.grey[800],
                    ),
                    
                    if (news.url.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: GestureDetector(
                          onTap: () async {
                            final String link = news.url;
                            if (link.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Invalid URL.')),
                              );
                              return;
                            }

                            final Uri url = Uri.parse(link);
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url, mode: LaunchMode.externalApplication);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Could not open the article.')),
                              );
                            }
                          },

                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: 'Read Full Article',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.launch,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
