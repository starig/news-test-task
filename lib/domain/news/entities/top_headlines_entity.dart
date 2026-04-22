import 'package:news_test_task/core/enums/category_enum.dart';
import 'package:news_test_task/data/news/dto/top_headlines_dto.dart';
import 'package:news_test_task/domain/news/entities/article_entity.dart';

class TopHeadlinesResponseEntity {
  final String status;
  final int totalResults;
  final List<ArticleEntity> articles;

  TopHeadlinesResponseEntity({required this.status, required this.totalResults, required this.articles});
}

class TopHeadlinesRequestEntity {
  final CategoryEnum? category;
  final String? query;
  final int? page;

  TopHeadlinesRequestEntity({this.category, this.query, this.page});

  TopHeadlinesRequestDto toDto() => TopHeadlinesRequestDto(category: category, query: query, page: page);
}
