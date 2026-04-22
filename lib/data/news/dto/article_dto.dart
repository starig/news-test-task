import 'package:json_annotation/json_annotation.dart';
import 'package:news_test_task/domain/news/entities/article_entity.dart';

part 'article_dto.g.dart';

@JsonSerializable(createToJson: false)
class ArticleDto {
  @JsonKey(name: "source")
  final SourceDto source;
  @JsonKey(name: "author")
  final String? author;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "urlToImage")
  final String? urlToImage;
  @JsonKey(name: "publishedAt")
  final String publishedAt;
  @JsonKey(name: "content")
  final String? content;

  ArticleDto({
    required this.source,
    this.author,
    required this.title,
    this.description,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory ArticleDto.fromJson(Map<String, dynamic> json) => _$ArticleDtoFromJson(json);

  ArticleEntity toEntity() => ArticleEntity(
    source: source.toEntity(),
    author: author,
    title: title,
    description: description,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
    content: content,
  );
}

@JsonSerializable(createToJson: false)
class SourceDto {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;

  SourceDto({this.id, this.name});

  factory SourceDto.fromJson(Map<String, dynamic> json) => _$SourceDtoFromJson(json);

  SourceEntity toEntity() => SourceEntity(id: id, name: name);
}
