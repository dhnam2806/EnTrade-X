import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/stock.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<DetailInitialEvent>(detailInitialEvent);
    on<PriceMatchingEvent>(priceMatchingEvent);
    on<PriceIncreaseEvent>(priceIncreaseEvent);
    on<PriceDecreaseEvent>(priceDecreaseEvent);
  }

  FutureOr<void> detailInitialEvent(
      DetailInitialEvent event, Emitter<DetailState> emit) {
    emit(DetailLoadingState());
    emit(DetailLoadedState(stock: event.stock));
  }

  FutureOr<void> priceMatchingEvent(
      PriceMatchingEvent event, Emitter<DetailState> emit) {
    emit(PriceMatchingState(priceMatching: event.priceMatching));
  }

  FutureOr<void> priceIncreaseEvent(
      PriceIncreaseEvent event, Emitter<DetailState> emit) {
    emit(PriceCounterState(priceCounter: event.priceIncrease + 1));
  }

  FutureOr<void> priceDecreaseEvent(
      PriceDecreaseEvent event, Emitter<DetailState> emit) {
    emit(PriceCounterState(priceCounter: event.priceDecrease - 1));
  }
}
