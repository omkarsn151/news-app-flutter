import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app_flutter/core/constants/api_constants/api_constants.dart';
import 'package:news_app_flutter/core/network/dio_client.dart';
import 'package:news_app_flutter/data/news_model.dart';

class NewsRepository {
    Future<List<NewsModel>> fetchTopHeadlines() async {
    try {
      final response = await DioClient.dio.get(ApiConstants.baseUrl);
      final articles = response.data['articles'] as List;
      print("${response.statusCode} : ${response.statusMessage} - News Fetched successfully");
      return articles.map((json) => NewsModel.fromJson(json)).toList();
    } catch (e) {
      print("Error: $e");
      throw Exception('Failed to load news');
    }
  }

  Future<List<NewsModel>> fetchNewsByCategory(String category) async {
    try {
      final url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=${dotenv.env['API_KEY']}";
      final response = await DioClient.dio.get(url);
      final articles = response.data['articles'] as List;
      print("${response.statusCode} : ${response.statusMessage} - $category News Fetched successfully");
      return articles.map((json) => NewsModel.fromJson(json)).toList();
    } catch (e) {
      print("Error: $e");
      throw Exception("Failed to load news for category: $category");
    }
  }
}