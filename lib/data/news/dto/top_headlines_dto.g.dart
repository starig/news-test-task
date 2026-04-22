// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_headlines_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopHeadlinesResponseDto _$TopHeadlinesResponseDtoFromJson(
  Map<String, dynamic> json,
) => TopHeadlinesResponseDto(
  status: json['status'] as String,
  totalResults: (json['totalResults'] as num).toInt(),
  articles: (json['articles'] as List<dynamic>)
      .map((e) => ArticleDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TopHeadlinesRequestDtoToJson(
  TopHeadlinesRequestDto instance,
) => <String, dynamic>{
  'category': _$CategoryEnumEnumMap[instance.category],
  'query': instance.query,
  'page': instance.page,
};

const _$CategoryEnumEnumMap = {
  CategoryEnum.business: 'business',
  CategoryEnum.entertainment: 'entertainment',
  CategoryEnum.general: 'general',
  CategoryEnum.health: 'health',
  CategoryEnum.science: 'science',
  CategoryEnum.sports: 'sports',
  CategoryEnum.technology: 'technology',
};
