import 'package:flutter/material.dart';
import 'package:rehabox/src/screens/challenges/challenges_screen.dart';
import 'package:rehabox/src/screens/coupons/coupons_screen.dart';
import 'package:rehabox/src/screens/home/home_screen.dart';
import 'package:rehabox/src/screens/profile/widgets/profile_screen.dart';
import 'package:rehabox/src/screens/timer/screens/timer_screen.dart';
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
                  if (ModalRoute.of(context)?.settings.name !=
                      HomeScreen.routeName) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.routeName,
                      (route) => route.settings.name == '/login',
                    );
                  }
                  break;
                case 1:
                  if (ModalRoute.of(context)?.settings.name !=
                      ChallengesScreen.routeName) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      ChallengesScreen.routeName,
                      (route) => route.settings.name == '/',
                    );
                  }
                  break;
                case 2:
                  if (ModalRoute.of(context)?.settings.name !=
                      TimerScreen.routeName) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      TimerScreen.routeName,
                      (route) => route.settings.name == '/login',
                    );
                  }
                  break;
                case 3:
                  if (ModalRoute.of(context)?.settings.name !=
                      CouponsScreen.routeName) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      CouponsScreen.routeName,
                      (route) => route.settings.name == '/',
                    );
                  }
                  break;
                case 4:
                  if (ModalRoute.of(context)?.settings.name !=
                      ProfileScreen.routeName) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      ProfileScreen.routeName,
                      (route) => route.settings.name == '/',
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
            currentIndex: ModalRoute.of(context)?.settings.name ==
                    ChallengesScreen.routeName
                ? 1
                : ModalRoute.of(context)?.settings.name ==
                        TimerScreen.routeName
                    ? 2
                    : ModalRoute.of(context)?.settings.name ==
                            CouponsScreen.routeName
                        ? 3
                        : ModalRoute.of(context)?.settings.name ==
                                ProfileScreen.routeName
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
