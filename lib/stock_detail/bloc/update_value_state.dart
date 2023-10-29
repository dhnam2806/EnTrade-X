part of 'update_value_bloc.dart';

@immutable
abstract class UpdateValueState {}

class UpdateValueInitial extends UpdateValueState {}

class DetailValueUpdatedState extends UpdateValueState {
  final String value;

  DetailValueUpdatedState({required this.value});
}

class PriceValueUpdatedState extends UpdateValueState {
  final String value;

  PriceValueUpdatedState({required this.value});
}