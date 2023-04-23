import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/features/cart/ui/cart.dart';
import 'package:learning_bloc/features/home/ui/productTileWidget.dart';
import 'package:learning_bloc/features/wishlist/ui/wishlist.dart';
import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitalEvent());
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        }
        if (state is HomeNavigateToWishListActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishList()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: Text("Learning Bloc"),
                  actions: [
                    IconButton(
                        onPressed: () {
                          print("Hello");
                          homeBloc.add(HomeWishlistButtonNavigateEvent());
                        },
                        icon: Icon(Icons.favorite_border)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeCartButtonNavigateEvent());
                        },
                        icon: Icon(Icons.shopping_cart_outlined)),
                  ],
                ),
                body: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ProductTileWidget(
                          productDataModel: successState.products[index]);
                    }));
          case HomeErrorState:
            return Scaffold(
              body: Center(child: Text("Error")),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
