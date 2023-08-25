import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Home/home_product_data_model.dart';
import 'package:flutter_application_1/Features/WishList/bloc/wish_list_bloc_bloc.dart';

class WishTileWidget extends StatelessWidget {
  const WishTileWidget({super.key, required this.productDataModel, required this.wishBloc});

  final HomeProductDataModel productDataModel;
  final WishListBlocBloc wishBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      // ignore: sort_child_properties_last
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,width: double.maxFinite,
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
                    wishBloc.add(WishListRemoveItemEvent(products: productDataModel));
                  },
                  // ignore: prefer_const_constructors
                  icon: Icon(
                    Icons.delete,
                    color: Colors.green,
                  )),
          ],)
            ],
          ),
          const SizedBox(height: 5,),
          
        ],
      ),
      decoration: BoxDecoration(border: Border.all(),
      borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}
