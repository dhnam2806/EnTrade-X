part of 'follow_bloc.dart';

@immutable
abstract class FollowState {}

class FollowActionState extends FollowState {}

class FollowInitialState extends FollowState {}

class FollowLoadingState extends FollowState {}

class StockLoadedState extends FollowState {
  final List<Stock> stocks;

  StockLoadedState({required this.stocks});
}

class NewsLoadedState extends FollowState {
  final List<News> news;

  NewsLoadedState({required this.news});
}

class SearchStockNavigateState extends FollowActionState {
}
