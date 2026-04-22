import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<FavoriteArticlesCubit, FavoriteArticlesState>(
          builder: (context, state) {
            if (state.favoriteArticles.isEmpty) {
              return const Center(
                child: Text('Nothing found...'),
              );
            }

            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
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
              ],
            );
          },
        ),
      ),
    );
  }
}
