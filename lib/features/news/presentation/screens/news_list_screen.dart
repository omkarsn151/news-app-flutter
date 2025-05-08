import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/core/constants/common_widgets/custom_text.dart';
import 'package:news_app_flutter/core/constants/common_widgets/error_widget.dart';
import 'package:news_app_flutter/features/news/bloc/news_bloc.dart';
import 'package:news_app_flutter/features/news/bloc/news_event.dart';
import 'package:news_app_flutter/features/news/bloc/news_state.dart';
import 'package:news_app_flutter/features/news/presentation/screens/news_detail_screen.dart';
import 'package:news_app_flutter/features/news/presentation/widgets/category_chips.dart';
import 'package:news_app_flutter/features/news/presentation/widgets/news_card.dart';
import 'package:news_app_flutter/features/news/repository/news_repository.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  late final NewsBloc _newsBloc;

  @override
  void initState() {
    super.initState();
    _newsBloc = NewsBloc(NewsRepository())..add(FetchNews());
  }

  @override
  void dispose() {
    _newsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _newsBloc,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "NEWS",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.black87,
              ),
              Container(
                margin: EdgeInsets.only(left: 4),
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: CustomText(
                  text: "DAILY",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              const CategoryChips(),
              Expanded(
                child: BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    if (state is NewsLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    } else if (state is NewsLoaded) {
                      return RefreshIndicator(
                        color: Theme.of(context).primaryColor,
                        onRefresh: () async {
                          if (state.category == 'Top Stories') {
                            context.read<NewsBloc>().add(FetchNews());
                          }else {
                            context.read<NewsBloc>().add(FetchNewsByCategory(state.category));
                          }
                        },
                        child: state.news.isEmpty 
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.article_outlined, size: 64, color: Colors.grey[400]),
                                  SizedBox(height: 16),
                                  CustomText(
                                    text: "No articles found",
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              padding: EdgeInsets.only(top: 12),
                              itemCount: state.news.length,
                              itemBuilder: (_, index) {
                                final news = state.news[index];
                                return NewsCard(
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
                              },
                            ),
                      );
                    } else if (state is NewsError) {
                      return SomethingWentWrongWidget();
                    }
                    return Center(
                      child: CustomText(
                        text: "No data available",
                          fontSize: 16,
                          color: Colors.grey[600],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}