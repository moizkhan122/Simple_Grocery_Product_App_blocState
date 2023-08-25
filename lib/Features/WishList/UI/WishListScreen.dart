import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/WishList/UI/WishTileWidget.dart';
import 'package:flutter_application_1/Features/WishList/bloc/wish_list_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
   final WishListBlocBloc wishListBloc = WishListBlocBloc();

  @override
  void initState() {
    wishListBloc.add(WishListBlocInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WishList Screen"),),
      body: BlocConsumer<WishListBlocBloc, WishListBlocState>(
        bloc: wishListBloc,
        listenWhen: (previous, current) => current is WishListBlocActionState,
        buildWhen: (previous, current) => current is !WishListBlocActionState,
        listener: (context, state) {
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishListBlocSuccessState:
            final successData = state as WishListBlocSuccessState;

              return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: successData.wishListProducts.length,
            itemBuilder: (context, index) => WishTileWidget(
              wishBloc: wishListBloc,
              productDataModel:successData.wishListProducts[index]),);
            default:
          }
          return Container();
        },
      ),
    );
  }
}