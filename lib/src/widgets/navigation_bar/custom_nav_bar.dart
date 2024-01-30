import 'package:flutter/material.dart';
import 'package:rehabox/src/widgets/navigation_bar/config.dart';
import 'package:rehabox/src/widgets/svg_icon.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: kCustomBottomNavigationBarHeight,
      // clipBehavior: Clip.hardEdge,
      // shadowColor: Colors.black.withOpacity(0.4),
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(64),
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(64),
          ),
          child: BottomNavigationBar(
            onTap: (int index) {},
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            items: const [
              BottomNavigationBarItem(
                icon: SvgIcon(iconString: homeSvgString),
                activeIcon: SvgIcon(iconString: homeSvgStringChosen),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(iconString: searchSvgString),
                activeIcon: SvgIcon(iconString: searchSvgStringChosen),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(iconString: mainSvgString, size: 40),
                label: 'Main',
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(iconString: moreSvgString),
                activeIcon: SvgIcon(iconString: moreSvgStringChosen),
                label: 'More',
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(iconString: profileSvgString),
                activeIcon: SvgIcon(iconString: profileSvgStringChosen),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
