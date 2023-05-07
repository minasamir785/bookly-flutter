import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/constant.dart';
import 'package:flutter/material.dart';

class BookDetailsSelectedBookData extends StatelessWidget {
  const BookDetailsSelectedBookData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return Container(
      margin: EdgeInsets.only(top: deviceHeight * (40 / 810)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "The Jungle Book",
            style: Styles.textstyle30.copyWith(fontFamily: kSpectralFont),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const Text(
            "Rudyard Kipling",
            style: Styles.textstyleLowOpacity18,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: deviceHeight * (14 / 810),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 18,
              ),
              const Text(
                " 4.7",
                style: Styles.textstyle16,
              ),
              SizedBox(
                width: deviceWidth * (9 / 475),
              ),
              Text(
                "(2222)",
                overflow: TextOverflow.ellipsis,
                style: Styles.textstyleLowOpacity14,
              ),
            ],
          )
        ],
      ),
    );
  }
}
