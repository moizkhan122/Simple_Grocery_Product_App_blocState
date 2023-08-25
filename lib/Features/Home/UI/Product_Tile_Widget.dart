import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Home/bloc/home_bloc_bloc.dart';
import 'package:flutter_application_1/Features/Home/home_product_data_model.dart';

class ProductTileW extends StatelessWidget{
  const ProductTileW({super.key, required this.productDataModel, required this.homeBloc});

  final HomeProductDataModel productDataModel;
  final HomeBloc homeBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.green,width: 4),
      borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.17,
            width: MediaQuery.of(context).size.width*0.5,
          decoration:  BoxDecoration(
    image: DecorationImage(
      image: NetworkImage(productDataModel.imgUrl),
    ),)
          ),

          const SizedBox(height: 15,),
          // ignore: prefer_const_constructors
          Text(productDataModel.name,style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
          const SizedBox(height: 5,),
          Text(productDataModel.category,style: const TextStyle(fontSize: 19,color: Colors.black)),
          const SizedBox(height:10,), 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$ ${productDataModel.price}',style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)),
            Row(
            children: [
            IconButton(
                  onPressed: () {
                    //add an event for emit state
                    homeBloc.add(HomeProductWishListButtonClickedEvent(clickedProducts: productDataModel));
                  },
                  // ignore: prefer_const_constructors
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductCartButtonClickedEvent(clickedProducts: productDataModel));
                  },
                  // ignore: prefer_const_constructors
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.green,
                  )),
          ],)
            ],
          ),
          const SizedBox(height: 5,),
          
        ],
      ),
    );
  }
}
/** */


