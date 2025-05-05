import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app_flutter/features/news/bloc/news_bloc.dart';
import 'package:news_app_flutter/features/news/bloc/news_event.dart';
import 'package:news_app_flutter/features/news/presentation/screens/news_list_screen.dart';
import 'package:news_app_flutter/features/news/repository/news_repository.dart';

Future <void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App BLoC Flutter',
      home: BlocProvider(
        create: (_) => NewsBloc(NewsRepository())..add(FetchNews()),
        child: NewsListScreen(),),
    );
  }
}