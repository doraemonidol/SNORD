import 'package:flutter/material.dart';
import 'package:rehabox/src/screens/profile/widgets/config.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:shimmer/shimmer.dart';

class SwitchingTabs extends StatefulWidget {
  const SwitchingTabs({
    required this.tabs,
    required this.onTabChange,
    super.key,
  });

  final List<String> tabs;
  final void Function(BuildContext context, int index) onTabChange;

  @override
  State<SwitchingTabs> createState() => _SwitchingTabsState();
}

class _SwitchingTabsState extends State<SwitchingTabs>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: widget.tabs.length,
    vsync: this,
  );
  @override
  Widget build(BuildContext context) {
    debugPrint('ProfileTabs.build');
    return Material(
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
          widget.onTabChange(context, index);
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
          for (var i = 0; i < widget.tabs.length; i++)
            TabItem(
              title: widget.tabs[i],
              isSelected: _tabController.index == i,
            ),
        ],
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
