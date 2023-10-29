import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_value_event.dart';
part 'update_value_state.dart';

class UpdateValueBloc extends Bloc<UpdateValueEvent, UpdateValueState> {
  UpdateValueBloc() : super(UpdateValueInitial()) {
    on<DetailValueUpdatedEvent>(detailValueUpdatedEvent);
    on<PriceValueUpdatedEvent>(priceValueUpdatedEvent);
  }

  FutureOr<void> detailValueUpdatedEvent(DetailValueUpdatedEvent event, Emitter<UpdateValueState> emit) {
    emit(DetailValueUpdatedState(value: event.value));
  }

  FutureOr<void> priceValueUpdatedEvent(PriceValueUpdatedEvent event, Emitter<UpdateValueState> emit) {
    emit(PriceValueUpdatedState(value: event.value));
  }
}
