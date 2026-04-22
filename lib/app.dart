import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_task/core/di/di.dart';
import 'package:news_test_task/features/favorite_articles/bloc/favorite_articles_cubit.dart';
import 'package:news_test_task/navigation/router.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<FavoriteArticlesCubit>()),
      ],
      child: MaterialApp.router(
        title: 'News Test Task',
        theme: ThemeData(
          colorScheme: .fromSeed(
            seedColor: Colors.deepPurple,
            primary: Color(0xff2F78FF),
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
