part of 'navbar_bloc.dart';

@immutable
abstract class NavbarEvent {}

class NavbarInitialEvent extends NavbarEvent {}

class NavbarChangeIndexEvent extends NavbarEvent {
  final int index;
  NavbarChangeIndexEvent({required this.index});
}