import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchNews extends NewsEvent {}

class FetchNewsByCategory extends NewsEvent {
  final String category;
  FetchNewsByCategory(this.category);

  @override
  List<Object?> get props => [category];
}