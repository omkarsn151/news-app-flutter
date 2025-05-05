import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=${dotenv.env['API_KEY']}';
  static const String keyword = '/top-headlines?';
  static const String country = 'country=us&';
}
