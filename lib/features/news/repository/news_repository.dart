import 'package:news_app_flutter/core/constants/api_constants/api_constants.dart';
import 'package:news_app_flutter/core/network/dio_client.dart';
import 'package:news_app_flutter/data/news_model.dart';

class NewsRepository {
    Future<List<NewsModel>> fetchTopHeadlines() async {
    try {
      final response = await DioClient.dio.get(ApiConstants.baseUrl);
      final articles = response.data['articles'] as List;
      return articles.map((json) => NewsModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load news');
    }
  }
}