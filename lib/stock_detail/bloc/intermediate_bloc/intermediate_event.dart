part of 'intermediate_bloc.dart';

@immutable
abstract class IntermediateEvent {}

class IntermediateInitialEvent extends IntermediateEvent {}


class IntermediateSelectedPriceEvent extends IntermediateEvent {
  final String index;

  IntermediateSelectedPriceEvent({required this.index});
}
