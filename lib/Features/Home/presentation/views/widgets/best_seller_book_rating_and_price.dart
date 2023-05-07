import 'package:bookly/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BestSellerBookRatingsAndPrice extends StatelessWidget {
  const BestSellerBookRatingsAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    //

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return Flex(
      direction: Axis.horizontal,
      children: [
        Text(
          "19.99\$",
          style: Styles.textstyle20.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: deviceWidth * 0.15,
        ),
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                " 4.7",
                style: Styles.textstyle16,
              ),
              Text(
                "(2222)",
                overflow: TextOverflow.ellipsis,
                style: Styles.textstyleLowOpacity14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
