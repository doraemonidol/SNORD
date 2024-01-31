import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rehabox/src/screens/coupons/coupon_item.dart';
import 'package:rehabox/src/widgets/custom_app_bar.dart';
import 'package:rehabox/src/widgets/custom_icon_button.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/navigation_bar/config.dart';
import 'package:rehabox/src/widgets/navigation_bar/custom_nav_bar.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  static const routeName = '/challenges';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarHeight: 72,
        title: Text(
          'Challenges',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: context.textScaleFactor(24),
          ),
        ),
        actions: [
          CustomIconButton(
            onPressed: (context) => Navigator.pop(context),
            icon: SvgPicture.string(searchSvgString),
          ),
          SizedBox(
            width: context.widthPercent(0.03) + 8,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: context.widthPercent(0.03) + 8,
          right: context.widthPercent(0.03) + 8,
          top: context.heightPercent(0.02),
          bottom: 12 + kCustomBottomNavigationBarHeight,
        ),
        child: const SizedBox.shrink(),
      ),
      extendBody: true,
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
