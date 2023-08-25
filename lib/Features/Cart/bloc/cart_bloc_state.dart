part of 'cart_bloc_bloc.dart';

@immutable
abstract class CartBlocState {}

abstract class CartBlocActionState extends CartBlocState {}

class CartBlocInitialState extends CartBlocState {}

class CartBlocSuccessState extends CartBlocState {
  
  final List<HomeProductDataModel> cartProducts;
  CartBlocSuccessState({required this.cartProducts});
}
