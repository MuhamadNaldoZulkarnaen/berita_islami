import 'dart:convert';
import 'package:http/http.dart' as http;

class GNewsService {
  static const String _apiKey = 'b9629a0ca72e161754513965e237eb0f';
  static const String _baseUrl = 'https://gnews.io/api/v4/top-headlines?lang=id&token=';

  Future<List<GNewsArticle>> fetchTopHeadlines() async {
    final url = Uri.parse('$_baseUrl$_apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data['articles'] ?? [];
      return articles.map((a) => GNewsArticle.fromJson(a)).toList();
    } else {
      throw Exception('Failed to fetch news: ${response.statusCode}');
    }
  }
}

class GNewsArticle {
  final String title;
  final String description;
  final String url;
  final String image;
  final String publishedAt;
  final String sourceName;

  GNewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.image,
    required this.publishedAt,
    required this.sourceName,
  });

  factory GNewsArticle.fromJson(Map<String, dynamic> json) {
    return GNewsArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      image: json['image'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      sourceName: json['source']?['name'] ?? '',
    );
  }
}
