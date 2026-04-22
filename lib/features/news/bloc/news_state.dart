part of 'news_cubit.dart';

@immutable
class NewsState {
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final int page;
  final List<ArticleEntity> articles;

  const NewsState({
    required this.isLoading,
    required this.isLoadingMore,
    required this.hasMore,
    required this.page,
    required this.articles,
  });

  NewsState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    int? page,
    List<ArticleEntity>? articles,
  }) {
    return NewsState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
      articles: articles ?? this.articles,
    );
  }
}
