import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_task/core/widgets/news/article_card.dart';
import 'package:news_test_task/features/news/bloc/news_cubit.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late final Future _future;

  @override
  void initState() {
    _future = context.read<NewsCubit>().getTopHeadlines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _future,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == .waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state.articles.isEmpty) {
                return Center(
                  child: Text("Nothing found..."),
                );
              }
              return Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: 19,
                  ),
                  itemCount: state.articles.length,
                  separatorBuilder: (_, _) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final article = state.articles[index];
                    return ArticleCard(article: article);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
