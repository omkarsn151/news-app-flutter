import 'package:equatable/equatable.dart';
import 'package:news_app_flutter/data/news_model.dart';

abstract class  NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<NewsModel> news;
  final String category;
  NewsLoaded(this.news, {this.category = 'Top Stories'});
  @override
  List<Object?> get props => [news];
}

class NewsError extends NewsState {
  final String message;
  NewsError(this.message);
  @override
  List<Object?> get props => [message];
}