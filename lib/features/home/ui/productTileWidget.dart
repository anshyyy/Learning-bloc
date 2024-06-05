import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:learning_bloc/features/home/models/homeProductDataModel.dart';

import '../bloc/home_bloc.dart';

class ProductTileWidget extends StatelessWidget {
  HomeBloc homeBloc;
  final ProductDataModel productDataModel;
  ProductTileWidget(
      {super.key, required this.homeBloc, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 222,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: 150,
              height: double.maxFinite,
              // child: Center(
              //   child: Image(image: NetworkImage(productDataModel.imageUrl)),
              // ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          NetworkImage(scale: 4.0, productDataModel.imageUrl))),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productDataModel.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(height: 5),
                Container(
                  width: 170,
                  child: Text(
                    productDataModel.description,
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      "Price :",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "\$ " + productDataModel.price.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeProductWishlistButtonClickedEvent(
                              clickedproduct: productDataModel));
                        },
                        icon: Icon(Icons.favorite_outlined)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeProductCartButtonClickedEvent(
                              clickedproduct: productDataModel));
                        },
                        icon: Icon(Icons.shopping_cart))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
