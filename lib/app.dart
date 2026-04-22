import 'package:flutter/material.dart';
import 'package:news_test_task/navigation/router.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'News Test Task',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: Colors.deepPurple,
          primary: Color(0xff2F78FF),
        ),
      ),
      routerConfig: router,
    );
  }
}
