import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedBooksShimmer extends StatelessWidget {
  const FeaturedBooksShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 0.3 * deviceHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 0.3 * deviceHeight,
            child: AspectRatio(
                aspectRatio: 2.5 / 4,
                child: Shimmer.fromColors(
                  direction: ShimmerDirection.rtl,
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.amber,
                      ),
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
