import 'package:flutter/material.dart';
import 'package:RAGDANews/models/news_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;

  const NewsDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail News"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${article.source?.name ?? ''} • ${article.publishedAt?.toLocal().toString().substring(0, 10) ?? ''}",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            if (article.urlToImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(article.urlToImage!),
              ),
            const SizedBox(height: 16),
            Text(
              article.content ?? article.description ?? 'No content available.',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
