// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleDto _$ArticleDtoFromJson(Map<String, dynamic> json) => ArticleDto(
  source: SourceDto.fromJson(json['source'] as Map<String, dynamic>),
  author: json['author'] as String?,
  title: json['title'] as String,
  description: json['description'] as String,
  urlToImage: json['urlToImage'] as String,
  publishedAt: json['publishedAt'] as String,
  content: json['content'] as String,
);

SourceDto _$SourceDtoFromJson(Map<String, dynamic> json) =>
    SourceDto(id: json['id'] as String?, name: json['name'] as String?);
