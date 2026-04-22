import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_task/core/enums/category_enum.dart';
import 'package:news_test_task/core/extensions/string_extension.dart';
import 'package:news_test_task/core/widgets/news/article_card.dart';
import 'package:news_test_task/features/news/bloc/news_cubit.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(_onScroll);
    unawaited(context.read<NewsCubit>().getTopHeadlines());
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    const threshold = 200.0;
    final isNearBottom = position.pixels >= position.maxScrollExtent - threshold;
    final isScrollingDown = position.userScrollDirection == ScrollDirection.reverse;

    if (isNearBottom && isScrollingDown) {
      context.read<NewsCubit>().loadMoreTopHeadlines();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state.isLoading && state.articles.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.articles.isEmpty) {
              return const Center(
                child: Text("Nothing found..."),
              );
            }

            return Column(
              children: [
                SizedBox(
                  height: 44,
                  child: ListView.separated(
                    scrollDirection: .horizontal,
                    itemCount: CategoryEnum.values.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 7),
                    itemBuilder: (BuildContext context, int index) {
                      final category = CategoryEnum.values[index];
                      return Container(
                        padding: .symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: .circular(22),
                        ),
                        child: Center(
                          child: Text(
                            category.name.capitalizeFirst,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontSize: 17,
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Expanded(
                  child: ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 19).copyWith(bottom: 100, top: 16),
                    itemCount: state.articles.length + (state.isLoadingMore ? 1 : 0),
                    separatorBuilder: (_, _) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == state.articles.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      final article = state.articles[index];
                      return ArticleCard(article: article);
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
