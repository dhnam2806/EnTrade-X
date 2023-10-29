import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/stock.dart';

part 'prices_event.dart';
part 'prices_state.dart';

class PricesBloc extends Bloc<PricesEvent, PricesState> {
  PricesBloc() : super(PricesInitial()) {
    on<SelectedPriceEvent>(selectedPriceEvent);
  }

  FutureOr<void> selectedPriceEvent(
      SelectedPriceEvent event, Emitter<PricesState> emit) {
    emit(SelectedPriceState(index: event.index));
    print(event.index);
  }
}
