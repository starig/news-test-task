import 'package:flutter/material.dart';
import 'package:news_test_task/domain/news/entities/article_entity.dart';
import 'package:news_test_task/features/article_details/view/article_details_view.dart';

class ArticleDetails extends StatelessWidget {
  final ArticleEntity article;
  const ArticleDetails({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return ArticleDetailsView(
      article: article,
    );
  }
}
