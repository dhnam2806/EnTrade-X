import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  int currentIndex = 0;
  NavbarBloc() : super(NavbarInitial()) {
    on<NavbarChangeIndexEvent>(navbarChangeIndexEvent);
  }

  FutureOr<void> navbarChangeIndexEvent(NavbarChangeIndexEvent event, Emitter<NavbarState> emit) {
    currentIndex = event.index;
    emit(NavbarChangeIndexState(index: currentIndex));

  }
}
