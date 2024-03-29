import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/screens/profile/controllers/user_profile_provider.dart';
import 'package:rehabox/src/screens/profile/widgets/config.dart';
import 'package:rehabox/src/screens/profile/widgets/profile_header.dart';
import 'package:rehabox/src/screens/settings/settings_screen.dart';
import 'package:rehabox/src/widgets/custom_app_bar.dart';
import 'package:rehabox/src/widgets/custom_icon_button.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/profile_tabs.dart';
import 'package:rehabox/src/widgets/svg_icon.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({
    this.appBarHeight = 300,
    this.isLoading = false,
    super.key,
  });

  final double appBarHeight;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    // debugPrint('ProfileAppBar.build');
    return CustomAppBar(
      appBarHeight: appBarHeight,
      title: const Text(
        'Your Profile',
      ),
      actions: [
        Hero(
          tag: 'settings',
          child: Material(
            color: Colors.transparent,
            child: CustomIconButton(
              onPressed: (context) => Navigator.pushNamed(
                context,
                SettingsScreen.routeName,
              ),
              icon: const SvgIcon(iconString: settingSvgString),
            ),
          ),
        ),
        SizedBox(
          width: context.widthPercent(0.03) + 8,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(context.heightPercent(0.1)),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: context.widthPercent(0.03) + 8,
            vertical: context.heightPercent(0.02),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isLoading)
                const ProfileHeader()
              else
                const ShimmerProfileHeader(),
              const SizedBox(
                height: 16,
              ),
              if (!isLoading)
                Selector<UserProfileProvider, ProfileBodyType>(
                  selector:
                      (BuildContext context, UserProfileProvider controller) =>
                          controller.state.profileBodyType,
                  builder: (BuildContext context, ProfileBodyType value,
                          Widget? child) =>
                      SwitchingTabs(
                    tabs: const [
                      'Activity',
                      'Achievements',
                    ],
                    onTabChange: (context, index) => context
                        .read<UserProfileProvider>()
                        .changeProfileBodyType(
                          index == 0
                              ? ProfileBodyType.activity
                              : ProfileBodyType.achievement,
                        ),
                  ),
                )
              else
                const ShimmerProfileTabs()
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
