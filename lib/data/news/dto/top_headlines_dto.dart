import 'package:json_annotation/json_annotation.dart';
import 'package:news_test_task/core/enums/category_enum.dart';
import 'package:news_test_task/data/news/dto/article_dto.dart';
import 'package:news_test_task/domain/news/entities/top_headlines_entity.dart';

part 'top_headlines_dto.g.dart';

@JsonSerializable(createToJson: false)
class TopHeadlinesResponseDto {
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "totalResults")
  final int totalResults;
  @JsonKey(name: "articles")
  final List<ArticleDto> articles;

  TopHeadlinesResponseDto({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory TopHeadlinesResponseDto.fromJson(Map<String, dynamic> json) => _$TopHeadlinesResponseDtoFromJson(json);

  TopHeadlinesResponseEntity toEntity() => TopHeadlinesResponseEntity(
    status: status,
    totalResults: totalResults,
    articles: articles.map((e) => e.toEntity()).toList(),
  );
}

@JsonSerializable(createFactory: false)
class TopHeadlinesRequestDto {
  final CategoryEnum? category;
  final String? query;
  final int? page;

  TopHeadlinesRequestDto({this.category, this.query, this.page});
}
