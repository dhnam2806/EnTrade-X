part of 'update_value_bloc.dart';

@immutable
abstract class UpdateValueEvent {}

class DetailValueUpdatedEvent extends UpdateValueEvent {
  final String value;

  DetailValueUpdatedEvent({required this.value});
}

class PriceValueUpdatedEvent extends UpdateValueEvent {
  final String value;

  PriceValueUpdatedEvent({required this.value});
}
