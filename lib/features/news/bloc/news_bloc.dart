import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/features/news/bloc/news_event.dart';
import 'package:news_app_flutter/features/news/bloc/news_state.dart';
import 'package:news_app_flutter/features/news/repository/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;
  NewsBloc(this.repository) : super(NewsInitial()) {
    on<FetchNews>((event, emit) async {
      emit (NewsLoading());
      try {
        final news = await repository.fetchTopHeadlines();
        emit(NewsLoaded(news));
      } catch (e) {
       emit(NewsError(e.toString()));
      }
    },);
  }
}