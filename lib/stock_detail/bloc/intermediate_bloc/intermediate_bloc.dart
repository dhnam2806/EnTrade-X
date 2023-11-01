import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:entradex/stock_detail/bloc/detail_bloc/detail_bloc.dart';
import 'package:meta/meta.dart';
part 'intermediate_event.dart';
part 'intermediate_state.dart';

class IntermediateBloc extends Bloc<IntermediateEvent, IntermediateState> {
  final DetailBloc detailBloc;
  IntermediateBloc(this.detailBloc) : super(IntermediateInitial()) {
    on<IntermediateInitialEvent>(intermediateInitialEvent);
    on<IntermediateSelectedPriceEvent>(intermediateSelectedPriceEvent);
  }

  FutureOr<void> intermediateInitialEvent(
      IntermediateInitialEvent event, Emitter<IntermediateState> emit) {
    final stock = detailBloc.state as DetailLoadedState;
    emit(IntermediateLoadingState());
    emit(IntermediateLoadedState(purchase: ""));
  }

  FutureOr<void> intermediateSelectedPriceEvent(
      IntermediateSelectedPriceEvent event, Emitter<IntermediateState> emit) {
    emit(IntermediateLoadingState());
    emit(IntermediateLoadedState(purchase: event.index));
  }
}
