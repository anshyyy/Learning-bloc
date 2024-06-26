import 'package:flutter/material.dart';
import 'package:learning_bloc/features/cart/bloc/cart_bloc.dart';

import '../../home/models/homeProductDataModel.dart';
import '../bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatefulWidget {
  WishlistBloc wishlistBloc;
  final ProductDataModel productDataModel;
  WishlistTileWidget(
      {super.key, required this.wishlistBloc, required this.productDataModel});

  @override
  State<WishlistTileWidget> createState() => _WishlistTileWidgetState();
}

class _WishlistTileWidgetState extends State<WishlistTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
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
                      image: NetworkImage(
                          scale: 4.0, widget.productDataModel.imageUrl))),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productDataModel.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(height: 5),
                Container(
                  width: 170,
                  child: Text(
                    widget.productDataModel.description,
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
                      "\$ " + widget.productDataModel.price.toString(),
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
                    SizedBox(width: 10),
                    IconButton(
                        onPressed: () {
                          widget.wishlistBloc.add(
                              WishlistRemoveFromWishlistEvent(
                                  productDataModel: widget.productDataModel));
                        },
                        icon: Icon(Icons.delete))
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
