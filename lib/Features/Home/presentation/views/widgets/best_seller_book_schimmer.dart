import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BestSellerBookSchimmer extends StatelessWidget {
  const BestSellerBookSchimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return Container(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Shimmer.fromColors(
        direction: ShimmerDirection.rtl,
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: deviceWidth * 0.08,
              ),
              margin: EdgeInsets.symmetric(
                vertical: deviceHeight * 0.01,
              ),
              height: deviceHeight * 0.15,
              width: deviceWidth * 0.8,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  AspectRatio(
                    aspectRatio: 2.5 / 4,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: deviceWidth * 0.08,
                  ),
                  Flexible(
                    child: Flex(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      direction: Axis.vertical,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: deviceHeight * 0.02,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: deviceHeight * 0.02,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: deviceHeight * 0.02,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
