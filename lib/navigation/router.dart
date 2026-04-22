import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_test_task/core/widgets/scaffold_with_nested_nav.dart';
import 'package:news_test_task/domain/news/entities/article_entity.dart';
import 'package:news_test_task/features/article_details/article_details.dart';
import 'package:news_test_task/features/news/news.dart';
import 'package:news_test_task/features/news_favorite/news_favorite.dart';

class Routes {
  static const String news = '/news';
  static const String newsFavorite = '/news-favorite';
  static const String newDetails = '/article-details';
}

final _routerKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: Routes.news,
  navigatorKey: _routerKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.news,
              name: Routes.news,
              builder: (context, state) {
                return const News();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.newsFavorite,
              name: Routes.newsFavorite,
              builder: (context, state) {
                return const NewsFavorite();
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.newDetails,
      name: Routes.newDetails,
      builder: (context, state) {
        final article = state.extra as ArticleEntity;
        return ArticleDetails(
          article: article,
        );
      },
    ),
  ],
);
