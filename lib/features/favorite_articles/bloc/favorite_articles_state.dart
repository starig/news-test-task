part of 'favorite_articles_cubit.dart';

@immutable
class FavoriteArticlesState {
  static const Object _errorMessageSentinel = Object();

  final List<ArticleEntity> favoriteArticles;
  final String? errorMessage;
  final int errorEventId;

  const FavoriteArticlesState({
    required this.favoriteArticles,
    required this.errorMessage,
    required this.errorEventId,
  });

  List<String> get favoriteArticlesUrls => favoriteArticles.map((e) => e.url).toList();

  FavoriteArticlesState copyWith({
    List<ArticleEntity>? favoriteArticles,
    Object? errorMessage = _errorMessageSentinel,
    int? errorEventId,
  }) {
    return FavoriteArticlesState(
      favoriteArticles: favoriteArticles ?? this.favoriteArticles,
      errorMessage: identical(errorMessage, _errorMessageSentinel) ? this.errorMessage : errorMessage as String?,
      errorEventId: errorEventId ?? this.errorEventId,
    );
  }
}
