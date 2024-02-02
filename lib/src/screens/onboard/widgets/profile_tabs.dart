import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/screens/profile/controllers/user_profile_provider.dart';
import 'package:rehabox/src/screens/profile/widgets/config.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:shimmer/shimmer.dart';

class ProfileTabs extends StatefulWidget {
  const ProfileTabs({super.key});

  @override
  State<ProfileTabs> createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );
  @override
  Widget build(BuildContext context) {
    debugPrint('ProfileTabs.build');
    return Selector<UserProfileProvider, ProfileBodyType>(
      selector: (BuildContext context, UserProfileProvider controller) =>
          controller.state.profileBodyType,
      builder: (BuildContext context, ProfileBodyType value, Widget? child) =>
          Material(
        color: const Color(0xFFEAECF0),
        borderRadius: BorderRadius.circular(24),
        child: TabBar(
          indicatorWeight: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 2,
          ),
          onTap: (int index) {
            _tabController.index = index;
            context.read<UserProfileProvider>().changeProfileBodyType(
                  index == 0
                      ? ProfileBodyType.activity
                      : ProfileBodyType.achievement,
                );
          },
          splashBorderRadius: BorderRadius.circular(16),
          controller: _tabController,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: const EdgeInsets.all(0),
          labelPadding: const EdgeInsets.all(0),
          labelColor: Colors.white,
          tabs: [
            TabItem(
              title: 'Activity',
              isSelected: _tabController.index == 0,
            ),
            TabItem(
              title: 'Achievements',
              isSelected: _tabController.index == 1,
            ),
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    required this.title,
    required this.isSelected,
    super.key,
  });

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      alignment: Alignment.center,
      width: context.widthPercent(0.45),
      height: context.heightPercent(0.035),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0F222C5C),
            blurRadius: 68,
            offset: Offset(58, 26),
            spreadRadius: 0,
          )
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? const Color(0xFF6B73FF) : const Color(0xFF686873),
          fontWeight: FontWeight.w700,
          fontSize: context.textScaleFactor(16),
        ),
      ),
    );
  }
}

class ShimmerProfileTabs extends StatelessWidget {
  const ShimmerProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        alignment: Alignment.center,
        height: context.heightPercent(0.04),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0F222C5C),
              blurRadius: 68,
              offset: Offset(58, 26),
              spreadRadius: 0,
            )
          ],
        ),
      ),
    );
  }
}
