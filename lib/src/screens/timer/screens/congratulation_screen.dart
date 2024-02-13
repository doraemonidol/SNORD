import 'package:flutter/material.dart';
import 'package:rehabox/src/screens/timer/config.dart';
import 'package:rehabox/src/widgets/custom_icon_button.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/svg_icon.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  static const routeName = '/congratulation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0XFFFFCA00),
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
                  SvgIcon(
                    iconString: congratulationSvgString,
                    size: context.widthPercent(1.0),
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Congrats!\n',
                      style: context.textTheme.titleLarge?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.primary,
                      ),
                      children: [
                        TextSpan(
                          text: 'You just reached your\n',
                          style: context.textTheme.titleLarge?.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: context.colorScheme.primary,
                          ),
                        ),
                        TextSpan(
                          text: 'milestone!',
                          style: context.textTheme.titleLarge?.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: context.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'This badge is a symbol of your\n',
                      style: context.textTheme.titleSmall?.copyWith(
                        color: context.colorScheme.primary,
                      ),
                      children: [
                        TextSpan(
                          text: 'commitment to yourself. Keep going\n',
                          style: context.textTheme.titleSmall?.copyWith(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        TextSpan(
                          text: 'and earn more badges along the ways.',
                          style: context.textTheme.titleSmall?.copyWith(
                            color: context.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
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
                        context.colorScheme.primary,
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
                      'Claim',
                      style: context.textTheme.titleSmall?.copyWith(
                        color: context.colorScheme.onPrimaryContainer,
                      ),
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
