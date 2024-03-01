import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/screens/profile/controllers/user_profile_provider.dart';
import 'package:rehabox/src/screens/profile/widgets/config.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/svg_icon.dart';
import 'package:shimmer/shimmer.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('ProfileHeader.build');
    return _HeaderTemplate(
      leading: Selector<UserProfileProvider, String>(
        builder: (BuildContext context, String value, Widget? child) =>
            CircleAvatar(
          radius: context.widthPercent(0.08),
          backgroundImage: NetworkImage(
            value,
          ),
        ),
        selector: (BuildContext context, UserProfileProvider controller) =>
            'https://picsum.photos/200',
      ),
      title: Selector<UserProfileProvider, String>(
        builder: (BuildContext context, String value, Widget? child) => Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: context.textScaleFactor(18),
          ),
        ),
        selector: (BuildContext context, UserProfileProvider controller) =>
            controller.state.user?.name ?? "",
      ),
      subtitle: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.widthPercent(0.02),
          vertical: 4,
        ),
        decoration: ShapeDecoration(
          color: const Color(0xFFFFF3DA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            const SvgIcon(
              iconString: goldMedalSvgString,
              size: 20,
            ),
            Selector<UserProfileProvider, String>(
              builder: (BuildContext context, String value, Widget? child) =>
                  Text(
                value,
                style: TextStyle(
                  color: const Color(0xFFFEA800),
                  fontSize: context.textScaleFactor(14),
                ),
              ),
              selector:
                  (BuildContext context, UserProfileProvider controller) =>
                      '${controller.state.user?.point ?? 0} Points',
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerProfileHeader extends StatelessWidget {
  const ShimmerProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return _HeaderTemplate(
      leading: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: CircleAvatar(
          radius: context.widthPercent(0.08),
          backgroundColor: Colors.white,
        ),
      ),
      title: const ShimmerContainer(
        widthFactor: 0.2,
      ),
      subtitle: const ShimmerContainer(),
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
    this.widthFactor = 0.3,
    this.heightFactor = 0.03,
  });

  final double widthFactor;
  final double heightFactor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: context.widthPercent(widthFactor),
        height: context.heightPercent(heightFactor),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class _HeaderTemplate extends StatelessWidget {
  const _HeaderTemplate({
    required this.leading,
    required this.title,
    required this.subtitle,
  });

  final Widget leading;
  final Widget title;
  final Widget subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        leading,
        SizedBox(
          width: context.widthPercent(0.03),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            title,
            SizedBox(
              height: context.heightPercent(0.01),
            ),
            subtitle,
          ],
        )
      ],
    );
  }
}
