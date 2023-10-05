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

class SearchStockNavigateEvent extends FollowEvent {}

class AddMoreEvent extends FollowEvent {}

class StockCollectionInitialEvent extends FollowEvent {}

class AddStockEvent extends FollowEvent {
  final String value;

  AddStockEvent({required this.value});
}

class SelectStockEvent extends FollowEvent {
  final String value;

  SelectStockEvent({required this.value});
}
