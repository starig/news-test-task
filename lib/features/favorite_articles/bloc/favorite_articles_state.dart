part of 'favorite_articles_cubit.dart';

@immutable
class FavoriteArticlesState {
  final List<ArticleEntity> favoriteArticles;
  const FavoriteArticlesState({required this.favoriteArticles});

  List<String> get favoriteArticlesUrls => favoriteArticles.map((e) => e.url).toList();

  FavoriteArticlesState copyWith({
    List<ArticleEntity>? favoriteArticles,
  }) {
    return FavoriteArticlesState(
      favoriteArticles: favoriteArticles ?? this.favoriteArticles,
    );
  }
}
