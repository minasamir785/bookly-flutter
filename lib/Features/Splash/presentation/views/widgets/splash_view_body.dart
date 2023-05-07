import 'package:bookly/Core/utils/assets.dart';
import 'package:bookly/Core/utils/service_locator.dart';
import 'package:bookly/Features/Home/presentation/views/home_view.dart';
import 'package:bookly/Features/Splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  //Variable Declartion

  //Animation Controller
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  late Animation<Offset> _animationReverse;

  //

  @override
  void initState() {
    super.initState();
    initAnimation();
    GetItSetup.setup();
    navToHome();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return columnUi();
        });
  }

  Widget columnUi() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        SlideTransition(
          position: _animationReverse,
          child: SvgPicture.asset(
            AssetsData.logo,
            width: 200,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        SlidingText(animation: _animation),
      ],
    );
  }

  void initAnimation() {
    //controller Duration
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    //forward for Slugon
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)
            .drive(
      Tween<Offset>(
        begin: const Offset(0, 1),
        end: const Offset(0, 0),
      ),
    );
    //reverse for logo
    _animationReverse =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)
            .drive(Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ));

    //start
    _animationController.forward();
  }

  void navToHome() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      GoRouter.of(context).replace(HomeView.route);
    });
  }
}
