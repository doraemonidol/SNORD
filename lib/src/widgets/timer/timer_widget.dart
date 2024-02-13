import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/screens/timer/controllers/timer_controllers.dart';
import 'package:rehabox/src/screens/timer/screens/congratulation_screen.dart';
import 'package:rehabox/src/utils/computation.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/svg_icon.dart';
import 'package:rehabox/src/widgets/timer/config.dart';

class CountdownClock extends StatefulWidget {
  const CountdownClock({
    required this.duration,
    required this.elapsed,
    this.pointsReceived,
    this.textStyle,
    this.size = const SizedBox(width: 350, height: 350),
    super.key,
  });

  final Duration duration;
  final Duration elapsed;
  final SizedBox size;
  final TextStyle? textStyle;
  final int? pointsReceived;

  @override
  State<CountdownClock> createState() => _CountdownClockState();
}

class _CountdownClockState extends State<CountdownClock>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> tween = Tween<double>(
    begin:
        (widget.duration.inSeconds - widget.elapsed.inSeconds).abs().toDouble(),
    end: 0,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    ),
  );
  late bool done = widget.elapsed.inSeconds > widget.duration.inSeconds;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: (widget.duration - widget.elapsed).abs(),
    )
      ..forward()
      ..addListener(() {
        setState(() {});
      });

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        setState(() {
          done = true;
          controller.duration = const Duration(days: 1);
          controller.reset();
          controller.forward();
          tween = Tween<double>(
            begin: const Duration(days: 1).inSeconds.toDouble(),
            end: 0,
          ).animate(
            CurvedAnimation(
              parent: controller,
              curve: Curves.linear,
            ),
          );
        });
        await Navigator.of(context)
            .pushNamed(
          CongratulationScreen.routeName,
        )
            .then((value) {
          context.read<TimerControllers>().updateExceedExpectedDuration(true);
          if (value == true) {
            // await context.read<TimerControllers>().claimAndCloseTimer();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var seconds = controller.duration!.inSeconds - tween.value.toInt();
    if (done) {
      seconds += widget.duration.inSeconds;
    } else {
      seconds += widget.elapsed.inSeconds;
    }
    return CustomPaint(
      painter: CountdownPainter(
        duration: done ? const Duration(days: 1) : widget.duration,
        animation: tween,
      ),
      child: SizedBox(
        width: widget.size.width,
        height: widget.size.height,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!done)
                const SvgIcon(
                  iconString: lockSvgString,
                  size: 70,
                )
              else
                const SvgIcon(
                  iconString: unlockSvgString,
                  size: 70,
                ),
              SizedBox(height: widget.size.height! * 0.03),
              Text(
                done ? 'Exceeded time' : 'Locked for',
                style: widget.textStyle ?? context.textTheme.titleSmall,
              ),
              SizedBox(height: widget.size.height! * 0.02),
              Text(
                "${done ? "-" : ""}${formatSeconds(seconds)}",
                style: widget.textStyle ?? context.textTheme.displayLarge,
              ),
              if (done) ...[
                SizedBox(height: widget.size.height! * 0.02),
                Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.widthPercent(0.02),
                      vertical: 4,
                    ),
                    decoration: ShapeDecoration(
                      color: const Color(0XFF4AC443).withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      '+ ${widget.pointsReceived ?? 0} Points',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: const Color(0XFF3BA935),
                      ),
                    )),
              ],
              SizedBox(height: widget.size.height! * 0.08),
              Text(
                done ? 'Keep up the good work!' : 'Try your best!',
                style: widget.textStyle ?? context.textTheme.titleSmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CountdownPainter extends CustomPainter {
  CountdownPainter({
    required this.animation,
    required this.duration,
    this.textStyle,
  });

  final Animation<num> animation;
  final Duration duration;
  final TextStyle? textStyle;

  static const Color remainingColor = Color(0XFFFEA800);
  static const Color borderColor = Color(0XFFFFE6B6);

  void drawCircularBorder(
    Canvas canvas,
    Paint paint,
    Offset center,
    double radius, {
    double startAngle = -90 * (pi / 180),
    double sweepAngle = 2 * pi,
  }) {
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double outerRadius = min(centerX, centerY);
    double innerRadius = outerRadius - 10;

    double remainingTime = duration.inSeconds - animation.value.toDouble();
    double sweepPercentage = remainingTime / duration.inSeconds;
    double sweepAngle = 360 * sweepPercentage;

    Color borderColor = CountdownPainter.borderColor;
    if (sweepPercentage >= 0.99) {
      borderColor = const Color(0XFF4AC443);
    }
    Color remainingColor = CountdownPainter.remainingColor;
    if (sweepPercentage >= 0.99) {
      remainingColor = const Color(0XFF4AC443);
    }
    Paint paint = Paint()
      ..color = borderColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0
      ..shader = LinearGradient(
        colors: [
          borderColor,
          remainingColor,
        ],
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2,
        ),
      )
      ..style = PaintingStyle.stroke;

    drawCircularBorder(canvas, paint, Offset(centerX, centerY), outerRadius);

    drawCircularBorder(canvas, paint, Offset(centerX, centerY), innerRadius);

    // Draw the remaining time in the middle of the two circles
    paint
      ..color = remainingColor
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;

    drawCircularBorder(
      canvas,
      paint,
      Offset(centerX, centerY),
      innerRadius + 5,
      startAngle: -90 * (pi / 180),
      sweepAngle: -sweepAngle * (pi / 180),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
