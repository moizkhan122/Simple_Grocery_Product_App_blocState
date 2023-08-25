import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Cart/UI/CartScreen.dart';
import 'package:flutter_application_1/Features/Home/UI/Product_Tile_Widget.dart';
import 'package:flutter_application_1/Features/Home/bloc/home_bloc_bloc.dart';
import 'package:flutter_application_1/Features/WishList/UI/WishListScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  
  HomeBloc homeBloc = HomeBloc();
@override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeBlocState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeBlocActionState,
      buildWhen: (previous, current) => current is !HomeBlocActionState,
      listener: (context, state) {
        if (state is HomeBlocNavigateCartActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen(),));
        }
        else if (state is HomeBlocNavigateWishListActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const WishListScreen(),));
        }
        else if(state is HomeProductButtonWishListedActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text("Item is WishListed",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)));
        }
        else if(state is HomeProductButtonCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text("Item is Carted",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold))));
        }  

      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeBlocLoadingState:
            return const Center(child: CircularProgressIndicator(color: Colors.green,),);
          case HomeBlocSuccessState :
            final succesState = state as HomeBlocSuccessState;
            return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Home Screen",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductWishListNavigateEvent());
                  },
                  // ignore: prefer_const_constructors
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductCartNavigateEvent());
                  },
                  // ignore: prefer_const_constructors
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  )),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 5 / 8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20),
              itemCount: succesState.products.length,
              itemBuilder: (BuildContext ctx, index) {
                return ProductTileW(
                  homeBloc: homeBloc,
                  productDataModel: succesState.products[index]);
              }),
          ),

        );
        case HomeBlocErrorState :
        return const Scaffold(body: Center(child: Text("Error Accured",style: TextStyle(fontSize: 30,color: Colors.green),)),);
          default:
          return const SizedBox();
        }
      },
    );
  }
}

/*// Padding(
//         padding: const EdgeInsets.all(8.0),
//         // implement GridView.builder
//         child: GridView.builder(
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 200,
//                 childAspectRatio: 3 / 2,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 20),
//             itemCount: myProducts.length,
//             itemBuilder: (BuildContext ctx, index) {
//               return Container(
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     color: Colors.amber,
//                     borderRadius: BorderRadius.circular(15)),
//                 child: Text(myProducts[index]["name"]),
//               );
//             }),
//       ),* */

/**ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: succesState.products.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: ProductTileW(
                homeBloc: homeBloc,
                productDataModel:succesState.products[index]),
            ),), */


            