part of 'news_cubit.dart';

@immutable
class NewsState {
  final bool isLoadingMore;
  final int page;
  final List<ArticleEntity> articles;

  const NewsState({required this.isLoadingMore, required this.page, required this.articles});

  NewsState copyWith({bool? isLoadingMore, int? page, List<ArticleEntity>? articles}) {
    return NewsState(
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      page: page ?? this.page,
      articles: articles ?? this.articles,
    );
  }
}
