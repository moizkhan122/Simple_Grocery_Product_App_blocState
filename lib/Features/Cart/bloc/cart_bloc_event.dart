part of 'cart_bloc_bloc.dart';

@immutable
abstract class CartBlocEvent {}

class CartBlocInitialEvent extends CartBlocEvent {}

class CartBlocRemoveEvent extends CartBlocEvent {}
