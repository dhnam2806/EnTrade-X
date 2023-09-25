part of 'follow_bloc.dart';

@immutable
abstract class FollowEvent {}

class FollowInitialEvent extends FollowEvent {}

class StockInitialEvent extends FollowEvent {}

class NewsInitialEvent extends FollowEvent {}

class StockSelectedEvent extends FollowEvent {
  final String value;

  StockSelectedEvent({required this.value});
}

class NewsSelectedEvent extends FollowEvent {
  final String value;

  NewsSelectedEvent({required this.value});
}

class SearchStockNavigateEvent extends FollowEvent {
  final String query;

  SearchStockNavigateEvent({required this.query});
}
