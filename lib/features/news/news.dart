import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_task/core/di/di.dart';
import 'package:news_test_task/features/news/bloc/news_cubit.dart';
import 'package:news_test_task/features/news/view/news_view.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewsCubit>(),
      child: NewsView(),
    );
  }
}
