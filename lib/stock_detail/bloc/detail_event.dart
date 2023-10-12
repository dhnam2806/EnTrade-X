part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class DetailInitialEvent extends DetailEvent {
  final Stock stock;

  DetailInitialEvent({required this.stock});
}

class PriceMatchingEvent extends DetailEvent {
  final double priceMatching;

  PriceMatchingEvent({required this.priceMatching});
}

class PriceIncreaseEvent extends DetailEvent {
  final double priceIncrease;

  PriceIncreaseEvent({required this.priceIncrease});
}

class PriceDecreaseEvent extends DetailEvent {
  final double priceDecrease;

  PriceDecreaseEvent({required this.priceDecrease});
}
