import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_task/core/widgets/error_snackbar.dart';
import 'package:news_test_task/core/widgets/news/article_card.dart';
import 'package:news_test_task/features/favorite_articles/bloc/favorite_articles_cubit.dart';

class FavoriteArticlesView extends StatefulWidget {
  const FavoriteArticlesView({super.key});

  @override
  State<FavoriteArticlesView> createState() => _FavoriteArticlesViewState();
}

class _FavoriteArticlesViewState extends State<FavoriteArticlesView> {
  @override
  void initState() {
    unawaited(context.read<FavoriteArticlesCubit>().getFavoriteArticles());
    super.initState();
  }

  Future<void> _onRefresh() async {
    await context.read<FavoriteArticlesCubit>().getFavoriteArticles();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteArticlesCubit, FavoriteArticlesState>(
      listenWhen: (previous, current) => previous.errorEventId != current.errorEventId,
      listener: (context, state) {
        if (!_isCurrentRoute(context) || state.errorMessage == null) return;
        showErrorSnackBar(
          context,
          message: state.errorMessage!,
        );
      },
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: BlocBuilder<FavoriteArticlesCubit, FavoriteArticlesState>(
            builder: (context, state) {
              if (state.favoriteArticles.isEmpty) {
                return RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Nothing found...'),
                              const SizedBox(height: 12),
                              FilledButton(
                                onPressed: () {
                                  unawaited(_onRefresh());
                                },
                                child: const Text('Try again'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: _onRefresh,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 19).copyWith(bottom: 120, top: 16),
                        itemCount: state.favoriteArticles.length,
                        separatorBuilder: (_, _) => const SizedBox(
                          height: 16,
                        ),
                        itemBuilder: (context, index) {
                          final article = state.favoriteArticles[index];
                          return ArticleCard(
                            article: article,
                            isFavorite: true,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  bool _isCurrentRoute(BuildContext context) {
    return ModalRoute.of(context)?.isCurrent ?? true;
  }
}
