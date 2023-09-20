part of 'navbar_bloc.dart';

@immutable
abstract class NavbarState {}

class NavbarInitial extends NavbarState {}

class NavbarChangeIndexState extends NavbarState {
  final int index;
  NavbarChangeIndexState({required this.index});
}
