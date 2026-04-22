part of 'news_cubit.dart';

@immutable
class NewsState {
  static const Object _selectedCategorySentinel = Object();

  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final int page;
  final List<ArticleEntity> articles;
  final CategoryEnum? selectedCategory;

  const NewsState({
    required this.isLoading,
    required this.isLoadingMore,
    required this.hasMore,
    required this.page,
    required this.articles,
    required this.selectedCategory,
  });

  NewsState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    int? page,
    List<ArticleEntity>? articles,
    Object? selectedCategory = _selectedCategorySentinel,
  }) {
    return NewsState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
      articles: articles ?? this.articles,
      selectedCategory: identical(selectedCategory, _selectedCategorySentinel)
          ? this.selectedCategory
          : selectedCategory as CategoryEnum?,
    );
  }
}
