part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class DetailInitialEvent extends DetailEvent {
  final Stock stock;

  DetailInitialEvent({required this.stock});
}

class DetailSelectedPriceEvent extends DetailEvent {
  final String index;

  DetailSelectedPriceEvent({required this.index});
}







