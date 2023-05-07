import 'package:bookly/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookDetailsYouCanAlsoLikeShimmer extends StatelessWidget {
  const BookDetailsYouCanAlsoLikeShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return Container(
      margin: EdgeInsets.only(top: deviceHeight * (25 / 810)),
      padding: EdgeInsets.symmetric(horizontal: deviceWidth * (30 / 375)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You can also like",
            style: Styles.textstyle14,
          ),
          SizedBox(
            height: deviceHeight * (140 / 810),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: deviceHeight * (20 / 810)),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: AspectRatio(
                      aspectRatio: 3 / 5,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)),
                        width: double.infinity,
                        height: deviceHeight * (130 / 810),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
