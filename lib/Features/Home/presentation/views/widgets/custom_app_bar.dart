import 'package:bookly/Core/utils/assets.dart';
import 'package:bookly/Features/Search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({
    super.key,
  });
  //

  //
  @override
  Widget build(BuildContext context) {
    //
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    //
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: deviceWidth * 0.08,
        vertical: deviceHeight * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            AssetsData.logo,
            height: deviceHeight * 0.02,
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(SearchView.route);
            },
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: deviceHeight * 0.03,
            ),
          )
        ],
      ),
    );
  }
}
