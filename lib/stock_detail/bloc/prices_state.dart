part of 'prices_bloc.dart';

@immutable
abstract class PricesState {}

class PricesInitial extends PricesState {}

class SelectedPriceState extends PricesState {
  final String index;
  SelectedPriceState({required this.index});
}
