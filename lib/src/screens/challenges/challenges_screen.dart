import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/models/models.dart';
import 'package:rehabox/src/repositories/repositories.dart';
import 'package:rehabox/src/screens/challenges/challenge_view_screen.dart';
import 'package:rehabox/src/screens/challenges/config.dart';
import 'package:rehabox/src/screens/challenges/controllers/challenges_controllers.dart';
import 'package:rehabox/src/screens/challenges/widgets/section.dart';
import 'package:rehabox/src/utils/conditional_render_manager.dart';
import 'package:rehabox/src/widgets/custom_app_bar.dart';
import 'package:rehabox/src/widgets/custom_icon_button.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/navigation_bar/config.dart';
import 'package:rehabox/src/widgets/navigation_bar/custom_nav_bar.dart';
import 'package:rehabox/src/widgets/shimmer_items_list.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  static const routeName = '/challenges';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChallengesControllers(
        userRepository: context.read<UserRepositoryInterface>(),
      )..fetchChallenges(),
      child: Scaffold(
        appBar: CustomAppBar(
          appBarHeight: 72,
          title: const Text(
            'Challenges',
          ),
          actions: [
            CustomIconButton(
              onPressed: (context) => Navigator.pop(context),
              icon: SvgPicture.string(findSvgString),
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
          child: Consumer<ChallengesControllers>(
            builder: conditionalRenderManager<ChallengesControllers>(
              onInitial: (BuildContext context) => const ShimmerItemsList(),
              onLoaded: (context) => Column(
                children: [
                  Selector<ChallengesControllers, List<Challenge>>(
                    builder: (BuildContext context, List<Challenge> value,
                            Widget? child) =>
                        ChallengeSection(
                      leading: const Text('Active'),
                      trailing: const Text('See all'),
                      challenges: value,
                      onTrailPressed: (context) {},
                      active: true,
                    ),
                    selector: (BuildContext context,
                            ChallengesControllers controllers) =>
                        controllers.state.activeChallenges,
                  ),
                  Selector<ChallengesControllers, List<Challenge>>(
                    builder: (BuildContext context, List<Challenge> value,
                            Widget? child) =>
                        ChallengeSection(
                      leading: const Text('More Challenges'),
                      trailing: const Text('See all'),
                      challenges: value,
                      onTrailPressed: (context) => Navigator.pushNamed(
                        context,
                        ChallengeViewScreen.routeName,
                        arguments: value,
                      ),
                      active: false,
                    ),
                    selector: (BuildContext context,
                            ChallengesControllers controllers) =>
                        controllers.state.recommendedChallenges,
                  ),
                ],
              ),
            ),
          ),
        ),
        extendBody: true,
        bottomNavigationBar: const CustomNavigationBar(),
      ),
    );
  }
}
