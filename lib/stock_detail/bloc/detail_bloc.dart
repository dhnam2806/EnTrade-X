import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/stock.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<DetailInitialEvent>(detailInitialEvent);
    on<PricePressEvent>(pricePressEvent);
  }

  FutureOr<void> detailInitialEvent(
      DetailInitialEvent event, Emitter<DetailState> emit) {
    emit(DetailLoadingState());
    emit(DetailLoadedState(stock: event.stock));
  }

  FutureOr<void> pricePressEvent(
      PricePressEvent event, Emitter<DetailState> emit) {
    emit(PricePressState(pricePress: event.pricePress));
    print("Price Press: ${event.pricePress}");
  }
}
