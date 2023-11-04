part of 'detail_bloc.dart';

@immutable
class DetailState {}

class DetailInitial extends DetailState {}

class DetailActionState extends DetailState {}

class DetailLoadingState extends DetailState {}

class DetailLoadedState extends DetailState {
  final Stock stock;

  DetailLoadedState({required this.stock});
}

class DetailSelectedState extends DetailActionState {
  final String purchase;

  DetailSelectedState({required this.purchase});
}
