part of 'detail_bloc.dart';

@immutable
class DetailState {}

class DetailActionState extends DetailState {}

class DetailInitial extends DetailState {}

class DetailLoadingState extends DetailState {}

class DetailLoadedState extends DetailState {
  final Stock stock;

  DetailLoadedState({required this.stock});
}

class PriceMatchingState extends DetailState {
  final double priceMatching;

  PriceMatchingState({required this.priceMatching});
}

class PriceCounterState extends DetailState {
  final double priceCounter;

  PriceCounterState({required this.priceCounter});
}

class PricePressState extends DetailState {
  final double pricePress;

  PricePressState({required this.pricePress});
}



