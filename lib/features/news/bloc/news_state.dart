part of 'news_cubit.dart';

@immutable
class NewsState {
  static const Object _selectedCategorySentinel = Object();
  static const Object _errorMessageSentinel = Object();

  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final int page;
  final List<ArticleEntity> articles;
  final CategoryEnum? selectedCategory;
  final String searchQuery;
  final String? errorMessage;
  final int errorEventId;

  const NewsState({
    required this.isLoading,
    required this.isLoadingMore,
    required this.hasMore,
    required this.page,
    required this.articles,
    required this.selectedCategory,
    required this.searchQuery,
    required this.errorMessage,
    required this.errorEventId,
  });

  NewsState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    int? page,
    List<ArticleEntity>? articles,
    Object? selectedCategory = _selectedCategorySentinel,
    String? searchQuery,
    Object? errorMessage = _errorMessageSentinel,
    int? errorEventId,
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
      searchQuery: searchQuery ?? this.searchQuery,
      errorMessage: identical(errorMessage, _errorMessageSentinel) ? this.errorMessage : errorMessage as String?,
      errorEventId: errorEventId ?? this.errorEventId,
    );
  }
}
