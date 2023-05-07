import 'package:bookly/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class TextBestSeller extends StatelessWidget {
  const TextBestSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    //
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        top: 0.06 * deviceHeight,
        left: deviceWidth * 0.08,
      ),
      child: const Text(
        "Best Seller",
        style: Styles.textstyle18,
      ),
    );
  }
}
