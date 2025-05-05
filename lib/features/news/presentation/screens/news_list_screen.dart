import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/core/constants/common_widgets/custom_text.dart';
import 'package:news_app_flutter/features/news/bloc/news_bloc.dart';
import 'package:news_app_flutter/features/news/bloc/news_event.dart';
import 'package:news_app_flutter/features/news/bloc/news_state.dart';
import 'package:news_app_flutter/features/news/presentation/screens/news_detail_screen.dart';
import 'package:news_app_flutter/features/news/presentation/widgets/news_tile.dart';
import 'package:news_app_flutter/features/news/repository/news_repository.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsBloc(NewsRepository())..add(FetchNews()),
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(text: "News", fontSize: 20, fontWeight: FontWeight.w600,), 
          centerTitle: true,),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state){
            if (state is NewsLoading) {
              return const Center(child: CircularProgressIndicator(),);
            } else if (state is NewsLoaded){
              return ListView.builder(
                itemCount: state.news.length,
                itemBuilder: (_, index) {
                  final news = state.news[index];
                  return NewsListTile(
                    news: news, 
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => NewsDetailScreen(news: news), 
                        ),
                      );
                    },
                  );
                }
                );
            }
            else if(state is NewsError){
              return Center(child: Text("Error: ${state.message}"),);
            }
            return Center(child: Text("No data"),);
          }),
      ),
    );
  }
}
