import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsCutomAppBar extends StatelessWidget {
  const BookDetailsCutomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: deviceWidth * (30 / 375)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
    );
  }
}
