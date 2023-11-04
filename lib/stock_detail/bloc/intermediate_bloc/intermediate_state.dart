part of 'intermediate_bloc.dart';

@immutable
abstract class IntermediateState {}

class IntermediateActionState extends IntermediateState {}

class IntermediateInitial extends IntermediateState {}

class IntermediateLoadingState extends IntermediateState {}

class IntermediateLoadedState extends IntermediateState {
  final String purchase;

  IntermediateLoadedState({required this.purchase});
}

class IntermediateSelectedState extends IntermediateActionState {
  final String purchase;

  IntermediateSelectedState({required this.purchase});
}