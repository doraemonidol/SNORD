import 'package:flutter/material.dart';
import 'package:rehabox/src/screens/profile/widgets/profile_screen.dart';
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
            onTap: (int index) {
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, '/');
                  break;
                case 1:
                  Navigator.pushNamed(context, '/search');
                  break;
                case 2:
                  Navigator.pushNamed(context, '/main');
                  break;
                case 3:
                  Navigator.pushNamed(context, '/more');
                  break;
                case 4:
                  if (ModalRoute.of(context)?.settings.name !=
                      ProfileScreen.routeName) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      ProfileScreen.routeName,
                      (route) => route.settings.name == '/login',
                    );
                  }
                  break;
                default:
                  Navigator.pushNamed(context, '/');
              }
            },
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex:
                // TODO: Add filter for home, search, main, more, profile
                ModalRoute.of(context)?.settings.name == ProfileScreen.routeName
                    ? 4
                    : 0,
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
