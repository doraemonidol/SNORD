import 'package:flutter/material.dart';
import 'package:rehabox/src/models/models.dart';
import 'package:rehabox/src/utils/computation.dart';
import 'package:rehabox/src/widgets/custom_icon_button.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';

class ChallengeViewScreen extends StatelessWidget {
  const ChallengeViewScreen({
    required this.challenge,
    super.key,
  });

  static const routeName = '/challenges/view';

  // Challenge to be displayed, passed through
  // Navigator.pushNamed(context, ChallengeViewScreen.routeName, arguments: challenge);
  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.71, -0.71),
            end: Alignment(-0.71, 0.71),
            colors: [Color(0xFF6B73FF), Color(0xFF000DFF)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Column(
          children: [
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(
                    context.widthPercent(0.03),
                  ),
                  child: CustomIconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: context.colorScheme.onPrimaryContainer,
                      size: 16,
                    ),
                    color: context.colorScheme.onError,
                    onPressed: (context) => Navigator.pop(context, false),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '🕔',
                    style: TextStyle(
                      fontSize: 60,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    challenge.name,
                    style: context.textTheme.titleLarge?.copyWith(
                      color: context.colorScheme.onError,
                      fontSize: context.textScaleFactor(28),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    getTimeline(challenge.startDate, challenge.duration),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onError,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    challenge.description ??
                        "Strive to complete this challenge!",
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onError,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(
                          context.widthPercent(0.94),
                          context.heightPercent(0.08),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        context.colorScheme.onError,
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(
                          horizontal: context.widthPercent(0.04),
                          vertical: context.heightPercent(0.02),
                        ),
                      ),
                      shadowColor: MaterialStatePropertyAll(
                        context.colorScheme.onError.withOpacity(0.2),
                      ),
                      elevation: const MaterialStatePropertyAll(8.0),
                    ),
                    onPressed: () => Navigator.pop(
                      context,
                      true, // Indicates the user accepts the challenge
                    ),
                    child: Text(
                      'Join the Challenge',
                      style: context.textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
