import 'package:flutter/material.dart';

class NewsFavoriteView extends StatefulWidget {
  const NewsFavoriteView({super.key});

  @override
  State<NewsFavoriteView> createState() => _NewsFavoriteViewState();
}

class _NewsFavoriteViewState extends State<NewsFavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('News Favorite'),
      ),
    );
  }
}
