part of 'wish_list_bloc_bloc.dart';

abstract class WishListBlocEvent {}

class WishListBlocInitialEvent extends WishListBlocEvent{}

class WishListBlocSuccessEvent extends WishListBlocEvent{}

class WishListRemoveItemEvent extends WishListBlocEvent{
  final HomeProductDataModel products;

  WishListRemoveItemEvent({required this.products});
}
