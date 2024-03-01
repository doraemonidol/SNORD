import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/repositories/authentication_repository/authentication_repository.dart';
import 'package:rehabox/src/screens/onboard/widgets/sliding_container.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rehabox/src/screens/onboard/widgets/config.dart';
import 'package:rehabox/src/widgets/svg_icon.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String routeName = '/onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('OnboardingScreen.build');
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF6B73FF),
            Color(0xFF000DFF),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Image.asset(
              "assets/images/circles.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            const Wrapped(),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: SizedBox(
          height:
              context.heightPercent(kCustomBottomNavigationBarHeightPercent),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: context.heightPercent(
                      kCustomBottomNavigationBarHeightPercent / 3),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    icon: const SvgIcon(
                      iconString: loginSvgString,
                      size: 20,
                    ),
                    label: const Text(
                      'Continue with E-mail',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF040415),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.infinity,
                  height: context.heightPercent(
                      kCustomBottomNavigationBarHeightPercent / 3),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context
                          .read<AuthenticationRepository>()
                          .signInWithGoogle(context);
                    },
                    icon: const SvgIcon(
                      iconString: googleSvgString,
                      size: 20,
                    ),
                    label: const Text(
                      'Continue with Google',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF040415),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "By continuing you agree Terms of Services & Privacy Policy ",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFAFB4FF),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Wrapped extends StatefulWidget {
  const Wrapped({super.key});

  @override
  State<Wrapped> createState() => _WrappedState();
}

class _WrappedState extends State<Wrapped> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: [
            SlidingContainer(
              image: Image.asset(
                "assets/images/first.png",
              ),
              header: "Breath Free",
              footer:
                  "Change your life by slowly quitting smoking, and adding new habit",
            ),
            SlidingContainer(
              image: Image.asset(
                "assets/images/second.png",
              ),
              header: "Track Your Progress",
              footer:
                  "Everyday you become one step closer to your goal, so don't give up",
            ),
            SlidingContainer(
              image: Image.asset(
                "assets/images/third.png",
              ),
              header: "Stay Together and Strong",
              footer:
                  "Find friends to discuss common topic, and challenges others",
            ),
          ],
          options: CarouselOptions(
            height: context.heightPercent(
                    1 - kCustomBottomNavigationBarHeightPercent) -
                50,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedSmoothIndicator(
                activeIndex: _currentPage,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  spacing: 16,
                  dotColor: Color(0xFF888EFF),
                  activeDotColor: Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
