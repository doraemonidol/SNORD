import 'package:flutter/material.dart';
import 'package:rehabox/src/screens/timer/config.dart';
import 'package:rehabox/src/widgets/custom_app_bar.dart';
import 'package:rehabox/src/widgets/custom_icon_button.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/navigation_bar/custom_nav_bar.dart';
import 'package:rehabox/src/widgets/svg_icon.dart';

class TimerShimmerScreen extends StatelessWidget {
  const TimerShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: CustomIconButton(
          icon: const SvgIcon(
            iconString: calendarSvgString,
          ),
          onPressed: (context) {},
        ),
        actions: [
          CustomIconButton(
            icon: const SvgIcon(
              iconString: notificationSvgString,
            ),
            onPressed: (context) {},
          ),
          SizedBox(width: context.widthPercent(0.03) + 8),
        ],
        appBarHeight: kAppBarHeight,
      ),
      bottomNavigationBar: const CustomNavigationBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please wait...',
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: context.colorScheme.errorContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
