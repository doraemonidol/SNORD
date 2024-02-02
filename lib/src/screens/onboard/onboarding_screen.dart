import 'package:flutter/material.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rehabox/src/screens/onboard/widgets/config.dart';
import 'package:rehabox/src/widgets/svg_icon.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const String routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
        body: Container(
          child: CarouselSlider(
            items: [
              Container(
                child: Center(
                  child: Text('Text 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Text 2'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Text 3'),
                ),
              ),
            ],
            options: CarouselOptions(
              height: context
                  .heightPercent(1 - kCustomBottomNavigationBarHeightPercent),
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
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
                      debugPrint('Hello');
                      Dialog(
                        child: Text('Hello'),
                      );
                    },
                    icon: const SvgIcon(
                      iconString: loginSvgString,
                      size: 20,
                    ),
                    label: Text(
                      'Continue with E-mail',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF040415),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.infinity,
                  height: context.heightPercent(
                      kCustomBottomNavigationBarHeightPercent / 3),
                  child: ElevatedButton.icon(
                    onPressed: null,
                    icon: const SvgIcon(
                      iconString: googleSvgString,
                      size: 20,
                    ),
                    label: Text(
                      'Continue with Google',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF040415),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
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
