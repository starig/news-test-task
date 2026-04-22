import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_test_task/domain/news/entities/article_entity.dart';
import 'package:news_test_task/features/favorite_articles/bloc/favorite_articles_cubit.dart';
import 'package:news_test_task/gen/assets.gen.dart';

class ArticleDetailsView extends StatefulWidget {
  final ArticleEntity article;

  const ArticleDetailsView({super.key, required this.article});

  @override
  State<ArticleDetailsView> createState() => _ArticleDetailsViewState();
}

class _ArticleDetailsViewState extends State<ArticleDetailsView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.icons.arrowLeft.svg(),
        ),
        actions: [
          BlocBuilder<FavoriteArticlesCubit, FavoriteArticlesState>(
            buildWhen: (previous, current) => previous.favoriteArticles != current.favoriteArticles,
            builder: (context, state) {
              final isFavorite = state.favoriteArticlesUrls.contains(widget.article.url);
              return IconButton(
                onPressed: () {
                  if (isFavorite) {
                    context.read<FavoriteArticlesCubit>().removeFavoriteArticle(widget.article.url);
                  } else {
                    context.read<FavoriteArticlesCubit>().addFavoriteArticle(widget.article);
                  }
                },
                icon: isFavorite ? Assets.icons.favoriteFilled.svg() : Assets.icons.favorite.svg(),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Text(
                widget.article.title,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontSize: 33,
                ),
              ),
              Text(
                widget.article.description ?? '',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 27,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    widget.article.source.name ?? '',
                    style: theme.textTheme.bodyLarge?.copyWith(fontSize: 19),
                  ),
                  Text(
                    widget.article.displayTime,
                    style: theme.textTheme.bodyLarge?.copyWith(fontSize: 19),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              if (widget.article.urlToImage != null)
                ClipRRect(
                  borderRadius: .circular(16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 265,
                    ),
                    child: Image.network(
                      widget.article.urlToImage!,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return Center(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (_, _, _) {
                        return const Center(
                          child: Icon(
                            Icons.image,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              const SizedBox(
                height: 18,
              ),
              Text(
                widget.article.content ?? '',
                style: theme.textTheme.bodyLarge?.copyWith(fontSize: 26),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
