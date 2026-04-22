import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_test_task/core/theme/colors.dart';
import 'package:news_test_task/domain/news/entities/article_entity.dart';
import 'package:news_test_task/gen/assets.gen.dart';
import 'package:news_test_task/navigation/router.dart';

class ArticleCard extends StatelessWidget {
  final ArticleEntity article;
  final bool isFavorite;

  const ArticleCard({super.key, required this.article, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.newDetails, extra: article);
      },
      child: Container(
        clipBehavior: .hardEdge,
        constraints: BoxConstraints(
          maxHeight: 131,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: .circular(16),
          border: .all(
            width: 0.5,
            color: AppColors.borderColor,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: .max,
          spacing: 12,
          children: [
            SizedBox(
              width: 130,
              child: Image.network(
                article.urlToImage ?? '',
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
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 11,
                    ).copyWith(
                      left: 0,
                    ),
                child: Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 175,
                          ),
                          child: Text(
                            article.title,
                            maxLines: 1,
                            overflow: .ellipsis,
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontSize: 24,
                            ),
                          ),
                        ),
                        if (isFavorite) Assets.icons.favoriteFilled.svg(height: 24),
                      ],
                    ),
                    Text(
                      article.description ?? '',
                      overflow: .ellipsis,
                      maxLines: 2,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 19,
                      ),
                    ),
                    Text(
                      article.displayTime,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 17,
                      ),
                      textAlign: .end,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
