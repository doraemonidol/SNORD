import 'package:flutter/material.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    required this.appBarHeight,
    this.isLoading = false,
    this.actions,
    this.bottom,
    super.key,
  });

  final double appBarHeight;
  final bool isLoading;

  final Widget title;
  final List<Widget>? actions;
  final PreferredSize? bottom;

  @override
  Widget build(BuildContext context) {
    // debugPrint('ProfileAppBar.build');
    return AppBar(
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.4),
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      leadingWidth: 200,
      leading: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.widthPercent(0.03) + 8,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: title,
        ),
      ),
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
