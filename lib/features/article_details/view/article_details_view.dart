import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_test_task/domain/news/entities/article_entity.dart';
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
          IconButton(
            onPressed: () {},
            icon: Assets.icons.favorite.svg(),
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
                "Title",
                style: theme.textTheme.labelLarge?.copyWith(
                  fontSize: 33,
                ),
              ),
              Text(
                "Subtitle",
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
                    "source",
                    style: theme.textTheme.bodyLarge?.copyWith(fontSize: 19),
                  ),
                  Text(
                    "MM.DD.YYYY",
                    style: theme.textTheme.bodyLarge?.copyWith(fontSize: 19),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: .circular(16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 265,
                  ),
                  child: Image.network(
                    "https://img.freepik.com/free-photo/lavender-field-sunset-near-valensole_268835-3910.jpg?semt=ais_hybrid&w=740&q=80",
                    fit: .fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
                style: theme.textTheme.bodyLarge?.copyWith(fontSize: 26),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
