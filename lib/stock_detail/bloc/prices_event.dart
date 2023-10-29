part of 'prices_bloc.dart';

@immutable
abstract class PricesEvent {}

class PricesInitialEvent extends PricesEvent {

}

class SelectedPriceEvent extends PricesEvent {
  final String index;
  SelectedPriceEvent({required this.index});
}
