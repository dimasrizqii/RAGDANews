import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:RAGDANews/models/news_model.dart';

class NewsViewModel with ChangeNotifier {
  final Dio _dio = Dio();
  final String _apiKey = '1ab8c7030949443d8e65ff77651e083e';

  List<Article> _articles = [];
  bool _isLoading = false;
  int _currentPage = 1;
  bool _hasMore = true;

  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> fetchNews({bool isLoadMore = false}) async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    if (!isLoadMore) {
      _articles = [];
      _currentPage = 1;
    }

    try {
      final response = await _dio.get(
        'https://newsapi.org/v2/everything',
        queryParameters: {
          'q': 'technology',
          'apiKey': _apiKey,
          'page': _currentPage,
          'pageSize': 20,
        },
      );

      final data = NewsModel.fromJson(response.data);
      if (data.articles.isEmpty) {
        _hasMore = false;
      } else {
        _articles.addAll(data.articles);
        _currentPage++;
      }
    } catch (e) {
      debugPrint('Fetch error: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}

