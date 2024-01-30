import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/repositories/repositories.dart';
import 'package:rehabox/src/screens/profile/controllers/user_profile_provider.dart';
import 'package:rehabox/src/screens/profile/widgets/profile_body.dart';
import 'package:rehabox/src/screens/profile/widgets/profile_app_bar.dart';
import 'package:rehabox/src/utils/conditional_render_manager.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/navigation_bar/config.dart';
import 'package:rehabox/src/widgets/navigation_bar/custom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProfileProvider(
        context.read<UserRepositoryInterface>(),
      )..read(),
      child: Consumer<UserProfileProvider>(
        builder: conditionalRenderManager<UserProfileProvider>(
          onInitial: (context) => Scaffold(
            appBar: ProfileAppBar(
              appBarHeight: context.heightPercent(0.25),
              isLoading: true,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                left: context.widthPercent(0.03) + 8,
                right: context.widthPercent(0.03) + 8,
                top: context.heightPercent(0.02),
                bottom: 12 + kCustomBottomNavigationBarHeight,
              ),
              child: const ShimmerActivityBody(),
            ),
            extendBody: true,
            bottomNavigationBar: const CustomNavigationBar(),
          ),
          onLoaded: (context) => Scaffold(
            appBar: ProfileAppBar(
              appBarHeight: context.heightPercent(0.25),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                left: context.widthPercent(0.03) + 8,
                right: context.widthPercent(0.03) + 8,
                top: context.heightPercent(0.02),
                bottom: 12 + kCustomBottomNavigationBarHeight,
              ),
              child: Selector<UserProfileProvider, ProfileBodyType>(
                selector:
                    (BuildContext context, UserProfileProvider controller) =>
                        controller.state.profileBodyType,
                builder: (BuildContext context, ProfileBodyType value,
                    Widget? child) {
                  if (value == ProfileBodyType.activity) {
                    return const ActivityBody();
                  } else {
                    return const AchievementsBody();
                  }
                },
              ),
            ),
            extendBody: true,
            bottomNavigationBar: const CustomNavigationBar(),
          ),
          onError: (BuildContext context) => const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          ),
        ),
      ),
    );
  }
}
