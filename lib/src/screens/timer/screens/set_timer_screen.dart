import 'package:flutter/material.dart';
import 'package:rehabox/src/widgets/custom_app_bar.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';

class SetTimerScreen extends StatefulWidget {
  const SetTimerScreen({super.key});

  static const String routeName = '/set-timer';

  @override
  State<SetTimerScreen> createState() => _SetTimerScreenState();
}

class _SetTimerScreenState extends State<SetTimerScreen> {
  Duration? _duration;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appBarHeight: 30,
        title: SizedBox.shrink(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.widthPercent(0.03) + 8,
          vertical: context.heightPercent(0.02),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Change Timer',
                style: context.textTheme.titleLarge,
              ),
              SizedBox(height: context.heightPercent(0.02)),
              Text(
                'You are restricted from consuming nicotine until the timer expires.',
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium,
              ),
              SizedBox(height: context.heightPercent(0.02)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _duration != null
          ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.widthPercent(0.03) + 8,
                vertical: context.heightPercent(0.02),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    _duration,
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    context.colorScheme.primaryContainer,
                  ),
                  surfaceTintColor: MaterialStateProperty.all(
                    context.colorScheme.primaryContainer,
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                      vertical: context.heightPercent(0.02),
                      horizontal: context.widthPercent(0.04),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all(
                    Size(
                      context.widthPercent(0.94) - 8,
                      60,
                    ),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                child: Text(
                  'Go!',
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
