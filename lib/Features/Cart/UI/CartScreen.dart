import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Cart/UI/CartTileWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
    final CartBlocBloc cartBlocBloc = CartBlocBloc();
    @override
  void initState() {
    cartBlocBloc.add(CartBlocInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart SCreen"),
      ),
      body: BlocConsumer<CartBlocBloc, CartBlocState>(
        listenWhen: (previous, current) => current is CartBlocActionState,
        buildWhen: (previous, current) => current is !CartBlocActionState,
        bloc: cartBlocBloc,
        listener: (context, state) {
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartBlocSuccessState:
            final succesData = state as CartBlocSuccessState;

              return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: succesData.cartProducts.length,
            itemBuilder: (context, index) => CartTileWidget(
              cartBloc: cartBlocBloc,
              productDataModel:succesData.cartProducts[index]),);
            default:
          }
          return Container();
        },
      ),
    );
  }
}
