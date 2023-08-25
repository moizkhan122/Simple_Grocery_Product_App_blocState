part of 'wish_list_bloc_bloc.dart';


abstract class WishListBlocState {}

abstract class WishListBlocActionState extends WishListBlocState {}

class WishListBlocInitial extends WishListBlocState {}

class WishListBlocSuccessState extends WishListBlocState {
  
  final List<HomeProductDataModel> wishListProducts;
  WishListBlocSuccessState({required this.wishListProducts});
}
