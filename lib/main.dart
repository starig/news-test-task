import 'package:flutter/material.dart';
import 'package:news_test_task/app.dart';
import 'package:news_test_task/core/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const NewsApp());
}
